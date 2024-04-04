//
//  Image.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

import Foundation
import DRColor
import DRMath
//import RustHelper

/// An image stored in RAM.
///
/// To load an image file, see `ColorImage.fromRgbaUnmultiplied`.
///
/// In order to paint the image on screen, you first need to convert it to
///
/// See also: `ColorImage`, `FontImage`.
public enum ImageData {
    /// RGBA image.
    case color(ColorImage)
    
    /// Used for the font texture.
    case font(FontImage)
    
}

public extension ImageData {
    var size: (Int, Int) {
        switch self {
        case .color(let image):
            return image.size
        case .font(let image):
            return image.size
        }
    }
    
    var width: Int {
        return size.0
    }
    
    var height: Int {
        return size.1
    }
    
    var bytesPerPixel: Int {
        switch self {
        case .color(_), .font(_):
            return 4
        }
    }
}

/// A 2D RGBA color image in RAM.
public struct ColorImage {
    /// width, height.
    public let size: (Int, Int)
    
    /// The pixels, row by row, from top to bottom.
    public var pixels: [Color32]
    
    public init(size: (Int, Int), pixels: [Color32]) {
        self.size = size
        self.pixels = pixels
    }
    
    /// Create an image filled with the given color.
    public init(size: (Int, Int), color: Color32) {
        self.size = size
        self.pixels = Array(repeating: color, count: size.0 * size.1)
    }
    
    /// Create a `ColorImage` from flat un-multiplied RGBA data.
    ///
    /// This is usually what you want to use after having loaded an image file.
    ///
    /// Panics if `size[0] * size[1] * 4 != rgba.count`.
    ///
    /// ## Example using the `image` crate:
    ///
    /// ```swift
    /// func loadImageFromPath(path: URL) -> Result<ColorImage, ImageError> {
    ///     let image = try ImageReader.open(path: path).decode()
    ///     let size = [image.width(), image.height()]
    ///     let imageBuffer = image.toRgba8()
    ///     let pixels = imageBuffer.asFlatSamples()
    ///     return ColorImage.fromRgbaUnmultiplied(size: size, rgba: pixels)
    /// }
    /// ```
    public static func fromRgbaUnmultiplied(size: (Int, Int), rgba: [UInt8]) -> ColorImage {
        assert(size.0 * size.0 * 4 == rgba.count)
        let pixels = stride(from: 0, to: rgba.count, by: 4).map { i in
            Color32.fromRgbaUnmultiplied(r: rgba[i], g: rgba[i+1], b: rgba[i+2], a: rgba[i+3])
        }
        return ColorImage(size: size, pixels: pixels)
    }
    
    public static func fromRgbaPremultiplied(size: (Int, Int), rgba: [UInt8]) -> ColorImage {
        assert(size.0 * size.1 * 4 == rgba.count)
        let pixels = stride(from: 0, to: rgba.count, by: 4).map { i in
            Color32.fromRgbaPremultiplied(r: rgba[i], g: rgba[i+1], b: rgba[i+2], a: rgba[i+3])
        }
        return ColorImage(size: size, pixels: pixels)
    }
    
    /// Create a `ColorImage` from flat opaque gray data.
    ///
    /// Panics if `size[0] * size[1] != gray.count`.
    public static func fromGray(size: (Int, Int), gray: [UInt8]) -> ColorImage {
        assert(size.0 * size.1 == gray.count)
        let pixels = gray.map { Color32.fromGray($0) }
        return ColorImage(size: size, pixels: pixels)
    }
    
    /// A view of the underlying data as `[UInt8]`
    //        public func asRaw() -> [UInt8] {
    //            var bytes = [UInt8]()
    //            let (width, height) = self.size
    //            bytes.reserveCapacity(width * height * 4)
    //            for i in 0..<(width*height) {
    //                let (r, g, b, a) = pixels[i].toTuple()
    //                let i4 = i*4
    //                bytes[i4] = r
    //                bytes[i4 + 1] = g
    //                bytes[i4 + 2] = b
    //                bytes[i4 + 3] = a
    //            }
    //        }
    
    //    /// A view of the underlying data as `&mut [u8]`
    //    #[cfg(feature = "bytemuck")]
    //    pub fn as_raw_mut(&mut self) -> &mut [u8] {
    //        bytemuck::cast_slice_mut(&mut self.pixels)
    //    }
    
    
    /// Create a new Image from a patch of the current image. This method is especially convenient for screenshotting a part of the app
    /// since `region` can be interpreted as screen coordinates of the entire screenshot if `pixelsPerPoint` is provided for the native application.
    /// The floats of `Rect` are cast to Int, rounding them down in order to interpret them as indices to the image data.
    ///
    /// Panics if `region.min.x > region.max.x || region.min.y > region.max.y`, or if a region larger than the image is passed.
    public func region(region: Rect, pixelsPerPoint: Float? = nil) -> ColorImage {
        let pixelsPerPoint = pixelsPerPoint ?? 1.0
        let min_x = Int(region.min.x * pixelsPerPoint)
        let max_x = Int(region.max.x * pixelsPerPoint)
        let min_y = Int(region.min.y * pixelsPerPoint)
        let max_y = Int(region.max.y * pixelsPerPoint)
        assert(min_x <= max_x)
        assert(min_y <= max_y)
        let width = max_x - min_x
        let height = max_y - min_y
        var output = Array<Color32>()
        output.reserveCapacity(width * height)
        let rowStride = size.0
        
        for row in min_y..<max_y {
            output.append(contentsOf: pixels[(row * rowStride + min_x)..<(row * rowStride + max_x)])
        }
        return ColorImage(size: (width, height), pixels: output)
    }
    
    /// Create a `ColorImage` from flat RGB data.
    ///
    /// This is what you want to use after having loaded an image file (and if
    /// you are ignoring the alpha channel - considering it to always be 0xff)
    ///
    /// Panics if `size[0] * size[1] * 3 != rgb.count`.
    public static func fromRgb(size: (Int, Int), rgb: [UInt8]) -> ColorImage {
        assert(size.0 * size.1 * 3 == rgb.count)
        let pixels = stride(from: 0, to: rgb.count, by: 3).map { i in
            Color32.fromRgb(r: rgb[i], g: rgb[i+1], b: rgb[i+2])
        }
        return ColorImage(size: size, pixels: pixels)
    }
    
    /// An example color image, useful for tests.
    public static func example() -> ColorImage {
        let width = 128
        let height = 64
        var pixels = [Color32]()
        pixels.reserveCapacity(width * height)
        for y in 0..<height {
            for x in 0..<width {
                let h = Float(x) / Float(width)
                let s: Float32 = 1.0
                let v: Float32 = 1.0
                let a = Float(y) / Float(height)
                pixels.append(Color32(hsva: Hsva(h: h, s: s, v: v, a: a) ))
            }
        }
        return ColorImage(size: (width, height), pixels: pixels)
    }
    
    @inlinable
    public subscript(x: Int, y: Int ) -> Color32 {
        get {
            let (w, h) = self.size;
            assert(x < w && y < h);
            return pixels[y * w + x]
        }
        set {
            let (w, h) = self.size;
            assert(x < w && y < h);
            pixels[y * w + x] = newValue
        }
    }
}

extension ColorImage: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "ColorImage(size: \(size), pixel-count: \(pixels.count))"
    }
}

/// A single-channel image designed for the font texture.
///
/// Each value represents "coverage", i.e. how much a texel is covered by a character.
///
/// This is roughly interpreted as the opacity of a white image.
public struct FontImage {
    /// width, height
    public var size: (Int, Int)
    
    /// The coverage value.
    ///
    /// Often you want to use `srgbaPixels` instead.
    public var pixels: [Float]
    
    public init(size: (Int, Int)) {
        self.size = size
        self.pixels = Array(repeating: 0.0, count: size.0 * size.1)
    }
    
    public init(size: (Int, Int), pixels: [Float32]) {
        self.size = size
        self.pixels = pixels
    }
}

public extension FontImage {
    @inlinable
    var width: Int {
        size.0
    }
    
    @inlinable
    var height: Int {
        size.1
    }
    
    
    /// Returns the textures as `sRGBA` premultiplied pixels, row by row, top to bottom.
    ///
    /// `gamma` should normally be set to `nil`.
    ///
    /// If you are having problems with text looking skinny and pixelated, try using a low gamma, e.g. `0.4`.
    func srgbaPixels(gamma: Float? = nil) -> AnySequence<Color32> {
        let gamma = gamma ?? 0.55 // this default coverage gamma is a magic constant, chosen by eye. I don't even know why we need it.
        return AnySequence(pixels.map { coverage in
            let alpha = pow(coverage, gamma)
            // We want to multiply with `vec4(alpha)` in the fragment shader:
            let a = UInt8( (alpha * Float32(255.0)).rounded() )
            return Color32(r: a, g: a, b: a, a: a)
        })
    }
    
    /// Clone a sub-region as a new image.
    func region(x: Int, y: Int, width: Int, height: Int) -> FontImage {
        assert(x + width <= self.width)
        assert(y + height <= self.height)
        
        var output = [Float32]()
        output.reserveCapacity(width * height)
        for row in y..<y + height {
            let offset = row * self.width + x
            output.append(contentsOf: pixels[offset..<(offset + width)])
        }
        return FontImage(size: (width, height), pixels: output)
    }
    
    @inlinable
    subscript(x: Int, y: Int ) -> Float32 {
        get {
            let (w, h) = self.size;
            assert(x < w && y < h);
            return pixels[y * w + x]
        }
        mutating set {
            let (w, h) = self.size;
            assert(x < w && y < h);
            pixels[y * w + x] = newValue
        }
    }
    
}

extension FontImage: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "FontImage(size: \(size))"
    }
}

/// A change to an image.
///
/// Either a whole new image, or an update to a rectangular region of it.
public struct ImageDelta {
    /// What to set the texture to.
    ///
    /// If `pos` is `nil`, this describes the whole texture.
    ///
    /// If `pos` is not `nil`, this describes a patch of the whole image starting at `pos`.
    public let image: ImageData
    
    public let options: TextureOptions
    
    /// If `nil`, set the whole texture to `image`.
    ///
    /// If not `nil`, update a sub-region of an already allocated texture with the patch in `image`.
    public let pos: (Int, Int)?
    
    public init(image: ImageData, options: TextureOptions, pos: (Int, Int)?) {
        self.image = image
        self.options = options
        self.pos = pos
    }
    
    /// Update the whole texture.
    public static func full(image: ImageData, options: TextureOptions) -> Self {
        ImageDelta(image: image, options: options, pos: nil)
   }
    
    
    /// Update a sub-region of an existing texture.
    public static func partial(pos: (Int, Int), image: ImageData, options: TextureOptions) -> Self {
        ImageDelta(image: image, options: options, pos: pos)
    }
    
    /// Is this affecting the whole texture?
    /// If `false`, this is a partial (sub-region) update.
    public func isWhole() -> Bool {
        return pos == nil
    }
}


