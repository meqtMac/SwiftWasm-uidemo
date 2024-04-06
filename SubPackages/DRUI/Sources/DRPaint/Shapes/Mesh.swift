////
////  Mesh.swift
////
////
////  Created by 蒋艺 on 2024/3/26.
////
//
//import Foundation
import DRColor
import DRMath

/// The 2D vertex type.
///
/// Should be friendly to send to GPU as is.
@frozen
public struct Vertex {
    /// Logical pixel coordinates (points).
    /// (0,0) is the top left corner of the screen.
    public var pos: Pos2
    
    /// Normalized texture coordinates.
    /// (0, 0) is the top left corner of the texture.
    /// (1, 1) is the bottom right corner of the texture.
    public var uv: Pos2
    
    /// sRGBA with premultiplied alpha
    public var color: Color32
    
    public init(pos: Pos2, uv: Pos2, color: Color32) {
        self.pos = pos
        self.uv = uv
        self.color = color
    }
}

/// Textured triangles in two dimensions.
public struct Mesh {
    /// Draw as triangles (i.e. the length is always multiple of three).
    ///
    /// If you only support 16-bit indices you can use [`Mesh::split_to_u16`].
    ///
    /// egui is NOT consistent with what winding order it uses, so turn off backface culling.
    public var indices: Array<UInt32>

    /// The vertex data indexed by `indices`.
    public var vertices: Array<Vertex>

    /// The texture to use when drawing these triangles.
    public var texture_id: TextureId
    // TODO(emilk): bounding rectangle
    
    public init(texture_id: TextureId) {
        self.indices = []
        self.vertices = []
        self.texture_id = texture_id
    }
}

public extension Mesh {
    
    /// Restore to default state, but without freeing memory.
    mutating func clear() {
        indices.removeAll()
        vertices.removeAll()
    }
    
        /// Calculates the total memory used by the mesh.
    func bytesUsed() -> Int {
            return MemoryLayout<Self>.size
              + vertices.count * MemoryLayout<Vertex>.size
              + indices.count * MemoryLayout<UInt32>.size
    }
    
    func isValid() -> Bool {
        // TODO: profile
        let count = vertices.count
        guard count < UInt32.max else {
            return false
        }
        let len = UInt32(count)
        return indices.allSatisfy { $0 < len }
    }
    
        func isEmpty() -> Bool {
        indices.isEmpty && vertices.isEmpty
    }
    
    /// Calculates a bounding rectangle for the mesh.
    func calcBounds() -> Rect {
        var bounds = Rect.nothing
        for vertex in vertices {
            bounds.extend(with: vertex.pos)
        }
        return bounds
    }
//    
    mutating func append(_ other: Self) {
        // TODO: profile
        assert(other.isValid())
        if isEmpty() {
            self = other
        } else {
            append(ref: other)
        }
    }
        
    mutating func append(ref other: Self) {
        assert(other.isValid())
        
        if self.isEmpty() {
            self.texture_id = other.texture_id
        } else {
            assert(self.texture_id == other.texture_id)
        }
        
        let indexOffset = UInt32(vertices.count)
        indices
            .append(contentsOf: other.indices.map { $0 + indexOffset} )
        
        vertices
            .append(contentsOf: other.vertices )
    }
    
        /// Adds a colored vertex to the mesh.
    @inlinable
    mutating func coloredVertex(pos: Pos2, color: Color32) {
        // TODO: assert textureId
        //        assert(textureId == TextureId.default, "Colored vertex requires default texture")
        vertices.append(Vertex(pos: pos, uv: WHITE_UV, color: color))
    }
    
     /// Adds a triangle to the mesh.0
      @inlinable
      mutating func addTriangle(a: UInt32, b: UInt32, c: UInt32) {
        indices.append(contentsOf: [a, b, c])
      }
    
    
       
    /// Reserves space for additional triangles (3x as many indices).
     @inlinable
     mutating func reserve_triangles(_ additionalTriangles: Int) {
         indices.reserveCapacity(additionalTriangles * 3)
     }
    
    /// Reserves space for additional vertices.
    @inlinable
    mutating func reserve_vertices(_ additional: Int) {
        vertices.reserveCapacity(additional)
    }
    
        
    // Adds a rectangle with a texture and color to the mesh.
      mutating func addRectWithUv(_ rect: Rect, uv: Rect, color: Color32) {
        let idx = UInt32(vertices.count)
          addTriangle(a: idx, b: idx + 1, c: idx + 2)
          addTriangle(a: idx + 2, b: idx + 1, c: idx + 3)

        vertices.append(contentsOf: [
          Vertex(pos: rect.leftTop(), uv: uv.leftTop(), color: color),
          Vertex(pos: rect.rightTop(), uv: uv.rightTop(), color: color),
          Vertex(pos: rect.leftBottom(), uv: uv.leftBottom(), color: color),
          Vertex(pos: rect.rightBottom(), uv: uv.rightBottom(), color: color),
        ])
      }
    
    
      /// Adds a uniformly colored rectangle to the mesh.
      @inlinable
    mutating func addColoredRect(_ rect: Rect, color: Color32) {
        // TODO: texture test
        assert(texture_id == TextureId.default, "Colored rectangle requires default texture")
        addRectWithUv(rect, uv: Rect(min: WHITE_UV, max: WHITE_UV), color: color)
    }
    
    /// This is for platforms that only support 16-bit index buffers.
    ///
    /// Splits this mesh into many smaller meshes (if needed)
    /// where the smaller meshes have 16-bit indices.
    func split_to_u16() -> Array<Mesh16> {
        assert(self.isValid())

        let maxSize: UInt32 = UInt32( UInt16.max )

        if vertices.count <= maxSize  {
            // Common-case optimization:
            return [Mesh16(
                indices: self.indices.map{UInt16($0)},
                vertices: self.vertices,
                texture_id: self.texture_id
            )]
        }
        

        var output: [Mesh16] = []
        var index_cursor: Int = 0

        while index_cursor < indices.count {
            let span_start = index_cursor;
            var min_vindex = self.indices[index_cursor];
            var max_vindex = self.indices[index_cursor];

            while index_cursor < self.indices.count {
                var new_min = min_vindex
                var new_max = max_vindex
                for i in 0...3 {
                    let idx = self.indices[index_cursor + i];
                    new_min = min(new_min, idx)
                    new_max = max(new_max, idx)
                }

                let new_span_size = new_max - new_min + 1; // plus one, because it is an inclusive range
                if new_span_size <= maxSize {
                    // Triangle fits
                    min_vindex = new_min;
                    max_vindex = new_max;
                    index_cursor += 3;
                } else {
                    break;
                }
            }
            
            assert(
                index_cursor > span_start,
                "One triangle spanned more than {MAX_SIZE} vertices"
            )

            let mesh = Mesh16 (
                indices: self.indices[span_start...index_cursor]
                    .map {
                        UInt16($0 - min_vindex)
                    },
                vertices: Array( self.vertices[Int(min_vindex)...Int(max_vindex)] ),
                texture_id: self.texture_id
            )
            
            output.append(mesh)
        }
        return output
    }

 
    /// Translate the mesh in-place by the given delta.
    mutating func translate(by delta: Vec2) {
        for index in vertices.indices {
            vertices[index].pos += Pos2(x: delta.x, y: delta.y)
        }
    }
    
    /// Rotate by some angle about an origin, in-place.
    ///
    /// Origin is a position in screen space.
    mutating func transform(by ts: TSTransform) {
        for index in vertices.indices {
            vertices[index].pos = ts * vertices[index].pos
        }
 
    }
    
    
    
     /// Rotate the mesh in-place by the given angle around an origin.
    ///
    /// - Parameters:
    ///   - rot: The rotation to apply.
    ///   - origin: The origin point in screen space.
    mutating func rotate(by rot: Rot2, around origin: Pos2) {
        for index in vertices.indices {
            vertices[index].pos = origin + rot * (vertices[index].pos - origin)
        }
    }
//
}
    
    
    
    
    
//}
//

/// A version of [`Mesh`] that uses 16-bit indices.
///
/// This is produced by [`Mesh::split_to_u16`] and is meant to be used for legacy render backends.
public struct Mesh16 {
    /// Draw as triangles (i.e. the length is always multiple of three).
    ///
    /// egui is NOT consistent with what winding order it uses, so turn off backface culling.
    public var indices: Array<UInt16>

    /// The vertex data indexed by `indices`.
    public var vertices: Array<Vertex>

    /// The texture to use when drawing these triangles.
    public var texture_id: TextureId
}

public extension Mesh16 {
    /// Are all indices within the bounds of the contained vertices?
    func isValid() -> Bool {
       guard vertices.count < UInt16.max else {
            return false
        }
        let n = vertices.count
        return indices.allSatisfy {
            $0 < n
        }
    }
}
