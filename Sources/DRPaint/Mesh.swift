//
//  Mesh.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

/// Textured triangles in two dimensions.
public struct Mesh {
    public var indices: [UInt32]
    public var vertices: [Vertex]
    // TODO: texture
    // public var textureId: TextureId
    
}

public extension Mesh {
    
    /// Resets the mesh to its default state without freeing memory.
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
    
    mutating func append(_ other: Self) {
        // TODO: profile
        assert(other.isValid())
        if isEmpty() {
            self = other
        } else {
            append(ref: other)
        }
    }
    
    /// Appends all indices and vertices from another `Mesh` without taking ownership.
    mutating func append(ref other: Self) {
        assert(other.isValid())
        
        if self.isEmpty() {
            // TODO: assign texture
        } else {
            // TODO: make sure the texture is same
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
    
    /// Adds a triangle to the mesh.
      @inlinable
      mutating func addTriangle(a: UInt32, b: UInt32, c: UInt32) {
        indices.append(contentsOf: [a, b, c])
      }
    
    /// Reserves space for additional triangles (3x as many indices).
     @inlinable
     mutating func reserveTriangles(_ additionalTriangles: Int) {
         indices.reserveCapacity(additionalTriangles * 3)
     }
    
    /// Reserves space for additional vertices.
    @inlinable
    mutating func reserveVertices(_ additional: Int) {
        vertices.reserveCapacity(additional)
    }
    
    
    // Adds a rectangle with a texture and color to the mesh.
      mutating func addRectWithUv(_ rect: Rect, uv: Rect, color: Color32) {
        let idx = UInt32(vertices.count)
          addTriangle(a: idx, b: idx + 1, c: idx + 2)
          addTriangle(a: idx + 2, b: idx + 1, c: idx + 3)

        vertices.append(contentsOf: [
          Vertex(pos: rect.leftTop, uv: uv.leftTop, color: color),
          Vertex(pos: rect.rightTop, uv: uv.rightTop, color: color),
          Vertex(pos: rect.leftBottom, uv: uv.leftBottom, color: color),
          Vertex(pos: rect.rightBottom, uv: uv.rightBottom, color: color),
        ])
      }

      /// Adds a uniformly colored rectangle to the mesh.
      @inlinable
    mutating func addColoredRect(_ rect: Rect, color: Color32) {
        // TODO: texture test
//        assert(textureId == TextureId.default, "Colored rectangle requires default texture")
        addRectWithUv(rect, uv: Rect(WHITE_UV, WHITE_UV), color: color)
    }
    
    /// Translate the mesh in-place by the given delta.
    @inlinable
    mutating func translate(by delta: Vec2) {
        for index in vertices.indices {
            vertices[index].pos += Pos2(delta.x, delta.y)
        }
    }
    
    /// Transform the mesh in-place with the given transform.
    @inlinable
    mutating func transform(by transform: TSTransform) {
       for index in vertices.indices {
            vertices[index].pos = transform * vertices[index].pos
        }
    }
    
    /// Rotate the mesh in-place by the given angle around an origin.
    ///
    /// - Parameters:
    ///   - rot: The rotation to apply.
    ///   - origin: The origin point in screen space.
    @inlinable
    mutating func rotate(by rot: Rot2, around origin: Pos2) {
        for index in vertices.indices {
            vertices[index].pos = origin + rot * (vertices[index].pos - origin)
        }
    }
}

