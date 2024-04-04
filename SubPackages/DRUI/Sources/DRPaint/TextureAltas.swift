//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//
import DRMath
import Foundation

struct Rectu: Equatable {
    /// inclusive
    var min_x: Int
    
    /// inclusive
    var min_y: Int
    
    /// exclusive
    var max_x: Int
    
    /// exclusive
    var max_y: Int
    
    init(min_x: Int, min_y: Int, max_x: Int, max_y: Int) {
        self.min_x = min_x
        self.min_y = min_y
        self.max_x = max_x
        self.max_y = max_y
    }
}

extension Rectu {
    static let nothing = Rectu(min_x: .max, min_y: .max, max_x: 0, max_y: 0)
    static let everything = Rectu(min_x: 0, min_y: 0, max_x: .max, max_y: .max)
}

struct PrerasterizedDisc {
    var r: Float32
    var uv: Rectu
}

/// A pre-rasterized disc (filled circle), somewhere in the texture atlas.
public struct PreparedDisc {
    /// The radius of this disc in texels.
    public var r: Float32
    
    /// Width in texels.
    public var w: Float32
    
    /// Where in the texture atlas the disc is.
    /// Normalized in 0-1 range.
    public var uv: Rect
}

/// Contains font data in an atlas, where each character occupied a small rectangle.
///
/// More characters can be added, possibly expanding the texture.
public struct TextureAtlas {
    var image: FontImage
    
    /// What part of the image that is dirty
    var dirty: Rectu
    
    /// Used for when allocating new rectangles.
    var cursor: (Int, Int)
    
    var row_height: Int
    
    /// Set when someone requested more space than was available.
    var overflowed: Bool
    
    /// pre-rasterized discs of radii `2^i`, where `i` is the index.
    var discs: Array<PrerasterizedDisc>
    
    init(image: FontImage, dirty: Rectu, cursor: (Int, Int), row_height: Int, overflowed: Bool, discs: Array<PrerasterizedDisc>) {
        self.image = image
        self.dirty = dirty
        self.cursor = cursor
        self.row_height = row_height
        self.overflowed = overflowed
        self.discs = discs
    }
    
    public init(size: (Int, Int)) {
        self = TextureAtlas(
            image: FontImage(size: size),
            dirty: .everything,
            cursor: (0, 0),
            row_height: 0,
            overflowed: false,
            discs: []
        )
        
        // Make the top left pixel fully white for `WHITE_UV`, i.e. painting something with solid color:
        let pos = self.allocate(w: 1, h: 1);
        //        assert_eq!(pos, (0, 0));
        assert(pos == (0, 0))
        image[pos.0, pos.1] = 1.0;
        
        // Allocate a series of anti-aliased discs used to render small filled circles:
        // TODO(emilk): these circles can be packed A LOT better.
        // In fact, the whole texture atlas could be packed a lot better.
        // for r in [1, 2, 4, 8, 16, 32, 64] {
        //     let w = 2 * r + 3;
        //     let hw = w as i32 / 2;
        let largestCircleRadius: Float32 = 8.0; // keep small so that the initial texture atlas is small
        for i in 0... {
            let r: Float32 = pow(2.0, Float32(i) / 2 - 1.0)
            if r > largestCircleRadius  {
                break;
            }
            let hw = Int32( (r + 0.5).rounded(.up) )
            let w = Int( 2 * hw + 1 )
            let (x, y) = self.allocate(w: w, h: w)
            for dx in -hw...hw {
                for dy in -hw...hw {
                    let distance_to_center = sqrt( Float32(dx * dx + dy * dy) )
                    let coverage =
                    remapClamp(distance_to_center, (r - 0.5)...(r + 0.5), 1.0...0.0);
                    image[Int(Int32(x) + hw + dx), Int(Int32(y) + hw + dy)] =
                    coverage;
                }
            }
            self.discs.append(PrerasterizedDisc (
                r: r,
                uv: Rectu(
                    min_x: x,
                    min_y: y,
                    max_x: x + w,
                    max_y: y + w )
            ) )
        }
        
    }
    
    /// Returns the coordinates of where the rect ended up,
    /// and invalidates the region.
}

public extension TextureAtlas {
    var size: (Int, Int) {
        image.size
    }
    
    func preparedDiscs() -> Array<PreparedDisc> {
        let size = size;
        let inv_w = 1.0 / Float32( size.0 )
        let inv_h = 1.0 / Float32( size.1 )
        
       return self.discs
            .map { disc in
                let r = disc.r
                let minX = Float32( disc.uv.min_x )
                let minY = Float32( disc.uv.min_y )
                let maxX = Float32( disc.uv.max_x )
                let maxY = Float32( disc.uv.max_y )
                let w = maxX - minX
                let uv = Rect(
                    min: Pos2(x: minX * inv_w, y: minY * inv_h),
                    max: Pos2(x: maxX * inv_w, y: maxY * inv_h)
                )
                return PreparedDisc(r: r, w: w, uv: uv)
            }
    }
    
    //
    var maxHeight: Int {
        // the initial width is likely the max texture side size
        image.width
    }
    
    /// When this get high, it might be time to clear and start over!
    var fillRatio: Float32 {
        if overflowed {
            return 1.0
        } else {
            return Float32(self.cursor.1 + self.row_height)  / Float32(self.maxHeight)
        }
        
    }
    
    /// The texture options suitable for a font texture
    @inlinable
    static func texture_options() -> TextureOptions {
        .linear
    }
    
    /// Call to get the change to the image since last call.
    mutating func takeDelta() -> ImageDelta? {
        let texture_options = Self.texture_options()

        let dirty = self.dirty
        self.dirty = .nothing
        if dirty == .nothing {
            return nil
        } else if dirty == .everything {
            return ImageDelta(image: .font(image), options: texture_options, pos: nil)
        } else {
            let pos = (dirty.min_x, dirty.min_y)
            let size = (dirty.max_x - dirty.min_x, dirty.max_y - dirty.min_y)
            let region = self.image.region(x: pos.0, y: pos.1, width: size.0, height: size.1);
            return ImageDelta(image: .font(region), options: texture_options, pos: pos)
        }
    }
   
    /// Returns the coordinates of where the rect ended up,
    /// and invalidates the region.
    mutating func allocate( w: Int, h: Int) -> (Int, Int) {
        /// On some low-precision GPUs (my old iPad) characters get muddled up
        /// if we don't add some empty pixels between the characters.
        /// On modern high-precision GPUs this is not needed.
        let padding: Int = 1
        
        
        assert(
            w <= self.image.width,
            "Tried to allocate a \(w) wide glyph in a \(image.width) wide texture atlas"
        )
        if self.cursor.0 + w > self.image.width {
            // New row:
            cursor.0 = 0;
            cursor.1 += row_height + padding;
            row_height = 0;
        }
        
        row_height = max(row_height, h);
        
        let required_height = self.cursor.1 + self.row_height;
        
        if required_height > self.maxHeight {
            // This is a bad place to be - we need to start reusing space :/
            
            //            #[cfg(feature = "log")]
            //            log::warn!("epaint texture atlas overflowed!");
            
            self.cursor = (0, self.image.height / 3); // Restart a bit down - the top of the atlas has too many important things in it
            self.overflowed = true; // this will signal the user that we need to recreate the texture atlas next frame.
        } else if image.resizeToMinHeight(requiredHeight: required_height) {
            self.dirty = .everything
        }
        
        let pos = self.cursor;
        self.cursor.0 += w + padding;
        
        self.dirty.min_x = min(dirty.min_x, pos.0)
        self.dirty.min_y = min(dirty.min_y, pos.1)
        self.dirty.max_x = min(dirty.max_x, pos.0 + 2)
        self.dirty.max_y = min(dirty.max_y, pos.1 + h)
        
        return pos
    }
    
}

extension FontImage {
    mutating func resizeToMinHeight(requiredHeight: Int) -> Bool {
        while requiredHeight >= self.height {
            self.size.1 *= 2
        }
        
        if width * height > pixels.count {
            pixels.append(contentsOf: [Float32](repeating: 0.0, count: width * height - pixels.count))
            return true
        } else {
            return false
        }
        
    }
    
    
}
