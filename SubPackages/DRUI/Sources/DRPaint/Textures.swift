//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

import Foundation

/// Low-level manager for allocating textures.
///
/// Communicates with the painting subsystem using [`Self::take_delta`].
public struct TextureManager {
    /// We allocate texture id:s linearly.
    var next_id: UInt64
    
    /// Information about currently allocated textures.
    var metas: Dictionary<TextureId, TextureMeta>
    
    var delta: TexturesDelta
    
    init(next_id: UInt64, metas: Dictionary<TextureId, TextureMeta>, delta: TexturesDelta) {
        self.next_id = next_id
        self.metas = metas
        self.delta = delta
    }
}

public extension TextureManager {
    /// Allocate a new texture.
    ///
    /// The given name can be useful for later debugging.
    ///
    /// The returned [`TextureId`] will be [`TextureId::Managed`], with an index
    /// starting from zero and increasing with each call to [`Self::alloc`].
    ///
    /// The first texture you allocate will be `TextureId::Managed(0) == TextureId::default()` and
    /// MUST have a white pixel at (0,0) ([`crate::WHITE_UV`]).
    ///
    /// The texture is given a retain-count of `1`, requiring one call to [`Self::free`] to free it.
    mutating func alloc(name: String, image: ImageData, options: TextureOptions) -> TextureId {
        //        let id = TextureId::Managed(self.next_id);
        let id = TextureId.managed(next_id)
        next_id += 1
        
        metas[id] = TextureMeta(
            name: name,
            size: image.size,
            bytes_per_pixel: image.bytesPerPixel,
            retain_count: 1,
            options: options
        )
        
        delta.set.append((id, .full(image: image, options: options)))
        return id
    }
    
    /// Assign a new image to an existing texture,
    /// or update a region of it.
    mutating func set(id: TextureId, delta: ImageDelta) {
       if var meta = metas[id] {
            if let pos = delta.pos {
                assert(pos.0 + delta.image.width <= meta.size.0 && pos.1 + delta.image.height <= meta.size.1, "Partial texture update is outside the bounds of texture")
            } else {
                // whole update
                meta.size = delta.image.size
                meta.bytes_per_pixel = delta.image.bytesPerPixel
                self.delta.set = self.delta.set.filter{ $0.0 != id }
            }
            self.delta.set.append((id, delta))
        } else {
            assert(false, "Tried setting texture which is not allocated")
        }
    }
    
    /// Free an existing texture.
    mutating func free(id: TextureId) {
        if let entry = metas.index(forKey: id) {
            metas[id]?.retain_count -= 1
            if metas[id]?.retain_count == 0 {
                metas.remove(at: entry)
                self.delta.free.append(id)
            }
            metas.remove(at: entry)
        } else {
            assert(false, "Tried freeing texture id: \(id) which is not allocated")
        }
    }
    
    /// Increase the retain-count of the given texture.
    ///
    /// For each time you call [`Self::retain`] you must call [`Self::free`] on additional time.
    mutating func retain(id: TextureId) {
       metas[id]?.retain_count += 1
        assert(metas[id] != nil,  "Tried retaining texture {id:?} which is not allocated")
   }
    
    /// Take and reset changes since last frame.
    ///
    /// These should be applied to the painting subsystem each frame.
    mutating func take_delta() -> TexturesDelta {
        let delta = self.delta
        self.delta = .init(set: [], free: [])
        return delta
    }
    
    /// Get meta-data about a specific texture.
    func meta(id: TextureId) -> TextureMeta? {
        metas[id]
    }
    
    /// Get meta-data about all allocated textures in some arbitrary order.
    func allocated() -> some Sequence<(TextureId, TextureMeta)> {
        self.metas.map { $0 }
    }
    
    /// Total number of allocated textures.
    func num_allocated() -> Int {
        self.metas.count
    }
   
}

/// Meta-data about an allocated texture.
public struct TextureMeta {
    /// A human-readable name useful for debugging.
    public var name: String
    
    /// width x height
    public var size: (Int, Int)
    
    /// 4 or 1
    public var bytes_per_pixel: Int
    
    /// Free when this reaches zero.
    public var retain_count: Int
    
    /// The texture filtering mode to use when rendering.
    public var options: TextureOptions
}

public extension TextureMeta {
    /// Size in bytes.
    /// width x height x [`Self::bytes_per_pixel`].
    func bytes_used() -> Int {
        size.0 * size.1 * bytes_per_pixel
    }
}


/// How the texture texels are filtered.
public enum TextureFilter {
    /// Show the nearest pixel value.
    ///
    /// When zooming in you will get sharp, square pixels/texels.
    /// When zooming out you will get a very crisp (and aliased) look.
    case nearest
    
    /// Linearly interpolate the nearest neighbors, creating a smoother look when zooming in and out.
    case linear
}

/// Defines how textures are wrapped around objects when texture coordinates fall outside the [0, 1] range.
public enum TextureWrapMode {
    /// Stretches the edge pixels to fill beyond the texture's bounds.
    ///
    /// This is what you want to use for a normal image in a GUI.
    case clampToEdge
    
    /// Tiles the texture across the surface, repeating it horizontally and vertically.
    case `repeat`
    
    /// Mirrors the texture with each repetition, creating symmetrical tiling.
    case mirroredRepeat
}


/// How the texture texels are filtered.
public struct TextureOptions {
    /// How to filter when magnifying (when texels are larger than pixels).
    public var magnification: TextureFilter
    
    /// How to filter when minifying (when texels are smaller than pixels).
    public var minification: TextureFilter
    
    /// How to wrap the texture when the texture coordinates are outside the [0, 1] range.
    public var wrapMode: TextureWrapMode
}

public extension TextureOptions {
    /// Linear magnification and minification.
    static let linear = TextureOptions(magnification: .linear, minification: .linear, wrapMode: .clampToEdge)
    
    /// Nearest magnification and minification.
    static let nearest = TextureOptions(magnification: .nearest, minification: .nearest, wrapMode: .clampToEdge)
    
    
    /// Linear magnification and minification, but with the texture repeated.
    static let linearRepeat = TextureOptions(magnification: .linear, minification: .linear, wrapMode: .repeat)
    
    /// Linear magnification and minification, but with the texture mirrored and repeated.
    static let linearMirroredRepeat = TextureOptions(magnification: .linear, minification: .linear, wrapMode: .mirroredRepeat)
    
    /// Nearest magnification and minification, but with the texture repeated.
    static let nearestRepeat = TextureOptions(magnification: .nearest, minification: .nearest, wrapMode: .repeat)
    
    /// Nearest magnification and minification, but with the texture mirrored and repeated.
    static let nearestMirroredRepeat = TextureOptions(magnification: .nearest, minification: .nearest, wrapMode: .mirroredRepeat)
}



/// What has been allocated and freed during the last period.
///
/// These are commands given to the integration painter.
public struct TexturesDelta {
    /// New or changed textures. Apply before painting.
    public var `set`: Array<(TextureId, ImageDelta)>
    
    /// Textures to free after painting.
    public var free: Array<TextureId>
}

public extension TexturesDelta {
    func isEmpty() -> Bool {
        self.set.isEmpty && self.free.isEmpty
    }
    
    mutating func append(newer: consuming Self) {
        self.set.append( contentsOf: newer.set)
        self.free.append(contentsOf: newer.free)
    }
    
    mutating func clear() {
        self.set.removeAll()
        self.free.removeAll()
    }
}
