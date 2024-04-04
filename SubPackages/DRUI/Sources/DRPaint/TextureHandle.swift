//
//  TextureHandle.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import RefCount
import DRMath

// MARK: Checked

/// Used to paint images.
///
/// An _image_ is pixels stored in RAM, and represented using [`ImageData`].
/// Before you can paint it however, you need to convert it to a _texture_.
///
/// If you are using egui, use `egui::Context::load_texture`.
///
/// The [`TextureHandle`] can be cloned cheaply.
/// When the last [`TextureHandle`] for specific texture is dropped, the texture is freed.
///
/// See also [`TextureManager`].
public struct TextureHandle: ~Copyable {
    @Arc
    public var tex_mngr: TextureManager
    public let id: TextureId
    
    init(tex_mngr_ref: Arc<TextureManager>, id: TextureId) {
        self.id = id
        _tex_mngr = tex_mngr_ref
    }
    
    
    public init(tex_mngr: consuming TextureManager, id: TextureId) {
        _tex_mngr = Arc(wrappedValue: tex_mngr)
        self.id = id
    }
    
    deinit {
        var arc = _tex_mngr
        arc.wrappedValue.free(id: id)
    }
    
    public func clone() -> Self {
        var arc = _tex_mngr
        arc.wrappedValue.retain(id: id)
        return TextureHandle(tex_mngr_ref: arc, id: id)
    }
}

public extension TextureHandle {
    static func == (lhs: borrowing TextureHandle, rhs: borrowing TextureHandle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    /// Assign a new image to an existing texture.
    mutating func set(image: ImageData, options: TextureOptions) {
        tex_mngr.set(id: id, delta: .full(image: image, options: options))
    }
    
    /// Assign a new image to a subregion of the whole texture.
    mutating func set_partial(
        pos: (Int, Int),
        image: ImageData,
        options: TextureOptions
    ) {
        tex_mngr.set(id: id, delta: .partial(pos: pos, image: image, options: options))
    }
    
    /// width x height
    func size() -> (Int, Int) {
        tex_mngr
            .meta(id: id)
            .map { (meta: TextureMeta?) -> (Int, Int) in
                if let tex = meta {
                    tex.size
                } else {
                    (0, 0)
                }
            } ?? (0, 0)
    }
    
    
    
    /// width x height
    func size_vec2() -> Vec2 {
        let (w, h) = self.size();
        return Vec2(x: Float32(w), y: Float32(h))
    }
    
    /// `width x height x bytes_per_pixel`
    func byte_size() -> Int {
        self.tex_mngr
            .meta(id: id)
            .map {
                $0.bytes_used()
            } ?? 0
    }
    
    /// width / height
    func aspect_ratio() -> Float32 {
        let (w, h) = self.size();
        return Float32(w) / min(Float32(h), 1)
    }
    
    /// Debug-name.
    func name() -> String {
        self.tex_mngr
            .meta(id: id)
            .map { meta in
                meta.name
            } ?? "<none>"
    }
}
