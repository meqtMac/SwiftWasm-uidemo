//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/4.
//

import DRMath
import DRColor

@usableFromInline
struct PathPoint {
    var pos: Pos2
    
    /// For filled paths the normal is used for anti-aliasing (both strokes and filled areas).
    ///
    /// For strokes the normal is also used for giving thickness to the path
    /// (i.e. in what direction to expand).
    ///
    /// The normal could be estimated by differences between successive points,
    /// but that would be less accurate (and in some cases slower).
    ///
    /// Normals are normally unit-length.
    var normal: Vec2
    
    init(pos: Pos2, normal: Vec2) {
        self.pos = pos
        self.normal = normal
    }
}

public enum PathType {
    case open
    case closed
}

// A connected line (without thickness or gaps) which can be tessellated
/// to either to a stroke (with thickness) or a filled convex area.
/// Used as a scratch-pad during tessellation.
public struct Path {
    
    @usableFromInline
    var points: [PathPoint]
    
    public init() {
        self.points = []
    }
}

public extension Path {
    
    @inline(__always)
    mutating func clear() {
        self.points.removeAll()
    }
    
    @inline(__always)
    mutating func reserve(additional: Int) {
        self.points.reserveCapacity(additional)
    }
    
    @inline(__always)
    mutating func addPoint(pos: Pos2, normal: Vec2) {
        self.points.append(PathPoint(pos: pos, normal: normal))
    }
    
    mutating func addCircle(center: Pos2, radius: Float) {
        // Precomputed vertices implementation is not directly translatable, you would need to provide the corresponding arrays or calculate the circle points.
        // These cutoffs are based on a high-dpi display. TODO(emilk): use pixels_per_point here?
        // same cutoffs as in add_circle_quadrant
        func helper(_ vec2: Vec2) -> PathPoint{
            PathPoint(pos: center + radius * vec2, normal: vec2)
        }
        if radius <= 2.0 {
            points.append(contentsOf: Path.CIRCLE_8.map( helper ))
        } else if radius <= 5.0 {
            points.append(contentsOf: Path.CIRCLE_16.map( helper ) )
        } else if radius < 18.0 {
            points.append(contentsOf: Path.CIRCLE_32.map( helper ) )
        } else if radius < 50.0 {
            points.append(contentsOf: Path.CIRCLE_64.map( helper ) )
        } else {
            points.append(contentsOf: Path.CIRCLE_128.map( helper ) )
        }
        
        
    }
    
    mutating func addLineSegment(points: (Pos2, Pos2)) {
        self.reserve(additional: 2)
        let normal = (points.1 - points.0).normalized().rot90()
        self.addPoint(pos: points.0, normal: normal)
        self.addPoint(pos: points.1, normal: normal)
    }
    
    mutating func addOpenPoints(points: [Pos2]) {
        let n = points.count
        assert(n >= 2)
        
        if n == 2 {
            // Common case optimization:
            self.addLineSegment(points: (points[0], points[1]))
        } else {
            self.reserve(additional: n)
            self.addPoint(pos: points[0], normal: (points[1] - points[0]).normalized().rot90())
            var n0 = (points[1] - points[0]).normalized().rot90()
            for i in 1..<n-1 {
                var n1 = (points[i + 1] - points[i]).normalized().rot90()
                
                // Handle duplicated points (but not triplicated…):
                if n0 == Vec2.zero {
                    n0 = n1
                } else if n1 == Vec2.zero {
                    n1 = n0
                }
                
                let normal = (n0 + n1) / 2.0
                let lengthSq = normal.lengthSquared()
                let rightAngleLengthSq: Float = 0.5
                let sharperThanARightAngle = lengthSq < rightAngleLengthSq
                if sharperThanARightAngle {
                    // cut off the sharp corner
                    let centerNormal = normal.normalized()
                    let n0c = (n0 + centerNormal) / 2.0
                    let n1c = (n1 + centerNormal) / 2.0
                    self.addPoint(pos: points[i], normal: n0c / n0c.lengthSquared())
                    self.addPoint(pos: points[i], normal: n1c / n1c.lengthSquared())
                } else {
                    // miter join
                    self.addPoint(pos: points[i], normal: normal / lengthSq)
                }
                
                n0 = n1
            }
            self.addPoint(pos: points[n - 1], normal: (points[n - 1] - points[n - 2]).normalized().rot90())
        }
    }
    
    mutating func addLineLoop(points: [Pos2]) {
        let n = points.count
        assert(n >= 2)
        self.reserve(additional: n)
        
        var n0 = (points[0] - points[n - 1]).normalized().rot90()
        
        for i in 0..<n {
            let nextI = (i + 1 == n) ? 0 : i + 1
            var n1 = (points[nextI] - points[i]).normalized().rot90()
            
            // Handle duplicated points (but not triplicated…):
            if n0 == Vec2.zero {
                n0 = n1
            } else if n1 == Vec2.zero {
                n1 = n0
            }
            
            let normal = (n0 + n1) / 2.0
            let lengthSq = normal.lengthSquared()
            
            // We can't just cut off corners for filled shapes like this,
            // because the feather will both expand and contract the corner along the provided normals
            // to make sure it doesn't grow, and the shrinking will make the inner points cross each other.
            //
            // A better approach is to shrink the vertices in by half the feather-width here
            // and then only expand during feathering.
            //
            // See https://github.com/emilk/egui/issues/1226
            let cutOffSharpCorners = false
            
            let rightAngleLengthSq: Float = 0.5
            let sharperThanARightAngle = lengthSq < rightAngleLengthSq
            if cutOffSharpCorners && sharperThanARightAngle {
                // cut off the sharp corner
                let centerNormal = normal.normalized()
                let n0c = (n0 + centerNormal) / 2.0
                let n1c = (n1 + centerNormal) / 2.0
                self.addPoint(pos: points[i], normal: n0c / n0c.lengthSquared())
                self.addPoint(pos: points[i], normal: n1c / n1c.lengthSquared())
            } else {
                // miter join
                self.addPoint(pos: points[i], normal: normal / lengthSq)
            }
            
            n0 = n1
        }
    }
    
    func strokeOpen(feathering: Float, stroke: Stroke, out: inout Mesh) {
        // Implement stroke_path for open path
    }
    
    func strokeClosed(feathering: Float, stroke: Stroke, out: inout Mesh) {
        // Implement stroke_path for closed path
    }
    
    func stroke(feathering: Float, pathType: PathType, stroke: Stroke, out: inout Mesh) {
        // Implement stroke_path for path type
    }
    
    mutating func fill(feathering: Float, color: Color32, out: inout Mesh) {
        // Implement fill_closed_path
    }
    
    mutating func fillWithUV(feathering: Float, color: Color32, textureId: TextureId, uvFromPos: (Pos2) -> Pos2, out: inout Mesh) {
        // Implement fill_closed_path_with_uv
    }
    
    internal subscript(index: Int) -> PathPoint {
        get {
            return points[index]
        }
        set {
            points[index] = newValue
        }
    }
}

public extension Path {

    /// overwrites existing points
    mutating func roundedRectangle(rect: Rect, rounding: Rounding) {
        clear()

        let min = rect.min
        let max = rect.max

        // let r = clampRounding(rounding, rect)

        // if r == Rounding.ZERO {
        //     self.reserveCapacity(4)
        //     self.append(Pos2(x: min.x, y: min.y)) // left top
        //     self.append(Pos2(x: max.x, y: min.y)) // right top
        //     self.append(Pos2(x: max.x, y: max.y)) // right bottom
        //     self.append(Pos2(x: min.x, y: max.y)) // left bottom
        // } else {
        //     // We need to avoid duplicated vertices, because that leads to visual artifacts later.
        //     // Duplicated vertices can happen when one side is all rounding, with no straight edge between.
        //     let eps = Float.ulpOfOne * rect.size().max()!

        //     addCircleQuadrant(&self, Pos2(x: max.x - r.se, y: max.y - r.se), r.se, 0.0) // south east

        //     if rect.width() <= r.se + r.sw + eps {
        //         self.removeLast() // avoid duplicated vertex
        //     }

        //     addCircleQuadrant(&self, Pos2(x: min.x + r.sw, y: max.y - r.sw), r.sw, 1.0) // south west

        //     if rect.height() <= r.sw + r.nw + eps {
        //         self.removeLast() // avoid duplicated vertex
        //     }

        //     addCircleQuadrant(&self, Pos2(x: min.x + r.nw, y: min.y + r.nw), r.nw, 2.0) // north west

        //     if rect.width() <= r.nw + r.ne + eps {
        //         self.removeLast() // avoid duplicated vertex
        //     }

        //     addCircleQuadrant(&self, Pos2(x: max.x - r.ne, y: min.y + r.ne), r.ne, 3.0) // north east

        //     if rect.height() <= r.ne + r.se + eps {
        //         self.removeLast() // avoid duplicated vertex
        //     }
        }
    }

    internal func clampRounding(rounding: Rounding, rect: Rect) -> Rounding {
        let halfWidth = rect.width * 0.5
        let halfHeight = rect.height * 0.5
        let maxCr = min(halfWidth, halfHeight)
        // round.
    }

    internal static func cwSignedArea(path: [PathPoint]) -> Float64 {
        if let last = path.last {
            var previous = last.pos
            var area: Float64 = 0.0

            for point in path {
                area += Float64(previous.x * point.pos.y - point.pos.x * previous.y)
                previous = point.pos
            }
            return area
        } else {
            return 0.0
        }
    }

    /// Tessellate the given convex area into a polygon.
    ///
    /// Calling this may reverse the vertices in the path if they are wrong winding order.
    ///
    /// The preferred winding order is clockwise.
    internal static func fillClosedPath(
        feathering: Float32, 
        path: inout [PathPoint], 
        color: Color32, 
        out: inout Mesh) {
        if color == .transparent {
            return 
        }

        let n = path.count
        if feathering > 0.0 {
            if cwSignedArea(path: path) < 0.0 {
                // Wrong winding order - fix:
                path.reverse()
                for index in path.indices {
                    path[index].normal = -path[index].normal
                }
            }
           
           out.reserveTriangles(3 * n)
           out.reserveVertices(2 * n)

           let colorOuter: Color32 = .transparent
           let idxInner = out.vertices.count
           let idxOuter = idxInner + 1
           

            // The fill:
            for i in 2..<n {
                out.addTriangle(a: UInt32(idxInner + 2 * (i - 1)), b: UInt32(), c: UInt32(idxInner + 2 * 1))
            }

            // The feathering
            var i0 = n - 1
            for i1 in 0..<n {
                let p1 = path[i1]
                let dm = 0.5 * feathering * p1.normal
                out.coloredVertex(pos: p1.pos - dm, color: color)
                out.coloredVertex(pos: p1.pos + dm, color: colorOuter)
                out.addTriangle(a: UInt32(idxInner + i1 * 2), b: UInt32(idxInner + i0 * 2), c: UInt32(idxOuter + 2 * i0))
                out.addTriangle(a: UInt32(idxOuter + i0 * 2 ), b: UInt32(idxOuter + i1 * 2), c: UInt32(idxOuter + 2 * i1))
                i0 = i1
            }
       } else {
            out.reserveTriangles(n)
            let idx = out.vertices.count

            out.vertices
            .append(contentsOf: path.map {Vertex(pos: $0.pos, uv: WHITE_UV, color: color)} )

            for i in 2..<Int(n) {
                out.addTriangle(a: UInt32(idx), b:  UInt32(idx + i - 1), c: UInt32(idx + 1))
            }
        }
    }


    /// Like [`fill_closed_path`] but with texturing.
    ///
    /// The `uv_from_pos` is called for each vertex position.
    internal static func fillClosedPathWithUv(
        feathering: Float32, 
        path: inout [PathPoint], 
        color: Color32, 
        textureId: TextureId, 
        uv_from_pos: (Pos2) -> Pos2, 
        out: inout Mesh
    ) {
        if color == .transparent {
            return
        }

        if out.isEmpty() {
            out.texture_id = textureId
        } else {
            assertionFailure("Mixing different `texture_id` in the same")
        }

        let n = path.count
        if feathering > 0.0 {
            if cwSignedArea(path: path) < 0.0 {
                path.reverse()
                for index in path.indices {
                    path[index].normal *= -1
                }
            }

            out.reserveTriangles(3 * n)
            out.reserveVertices(2 * n)
            let colorOuter: Color32 = .transparent
            let idxInner = out.vertices.count
            let idxOuter = idxInner + 1

            // The fill
            for i in 2..<n {
                out.addTriangle(a: UInt32(idxInner + 2 * (i - 1)), b: UInt32(idxInner), c: UInt32(idxInner + 2 * i))
            }

            // The feathering
            var i0 = n - 1
            for i1 in 0..<n {
                let p1 = path[i1]
                let dm = 0.2 * feathering * p1.normal

                let pos = p1.pos - dm
                out.vertices.append(Vertex(pos: pos, uv: uv_from_pos(pos), color: colorOuter))

                out.addTriangle(a: UInt32(idxInner + i1 * 2), b: UInt32(idxInner + i0 * 2), c: UInt32(idxInner + 2 * i0))
                out.addTriangle(a: UInt32(idxOuter + i0 * 2), b: UInt32(idxOuter + i1 * 2), c: UInt32(idxInner + 2 * i1))
                i0 = i1
            }
        } else {
            out.reserveTriangles(n)
            let idx = out.vertices.count
            out.vertices.append(contentsOf: path.map {
                Vertex(pos: $0.pos, uv: uv_from_pos($0.pos), color: color)
            })
            for i in 2..<n {
                out.addTriangle(a: UInt32(idx), b: UInt32(idx + i - 1), c: UInt32(idx + i))
            }
        }
   }

    /// Tessellate the given path as a stroke with thickness.
    internal static func strokePath(feathering: Float32, path: [PathPoint], pathType: PathType, stroke: Stroke, out: inout Mesh) {
        let n = path.count

        if stroke.width <= 0.0 || stroke.color == .transparent || n < 2 {
            return
        }

        let idx = out.vertices.count

        if feathering > 0.0 {
            let colorInner = stroke.color
            let colorOuter: Color32 = .transparent

            let thinLine = stroke.width <= feathering
            if thinLine {
                /*
                We paint the line using three edges: outer, inner, outer.

                .       o   i   o      outer, inner, outer
                .       |---|          feathering (pixel width)
                */

                // Fade out as it gets thinner:
                let colorInner = mul_color(color: colorInner, factor: stroke.width / feathering)
                if colorInner == .transparent {
                    return
                }

                out.reserveTriangles(4 * n)
                out.reserveTriangles(3 * n)

                var i0 = n - 1
                for i1 in 0..<n {
                    let connectWithPrevious = pathType == .closed || i1 > 0 
                    let p1 = path[i1]
                    let p = p1.pos
                    let n = p1.normal

                    out.coloredVertex(pos: p + n * feathering, color: colorOuter)
                    out.coloredVertex(pos: p, color: colorInner)
                    out.coloredVertex(pos: p - n * feathering, color: colorOuter)

                    if connectWithPrevious {
                        out.addTriangle(a: UInt32(idx + 3 * i0 + 0), b: UInt32(idx + 3 * i0 + 1), c: UInt32(idx + 3 * i1 + 0))
                        out.addTriangle(a: UInt32(idx + 3 * i0 + 1), b: UInt32(idx + 3 * i1 + 0), c: UInt32(idx + 3 * i1 + 1))

                        out.addTriangle(a: UInt32(idx + 3 * i0 + 1), b: UInt32(idx + 3 * i0 + 2), c: UInt32(idx + 3 * i1 + 1))
                        out.addTriangle(a: UInt32(idx + 3 * i0 + 2), b: UInt32(idx + 3 * i0 + 1), c: UInt32(idx + 3 * i1 + 2))
                    }
                    i0 = i1
                }
            }
        } else {
            // not anti-aliased:
            out.reserveTriangles(2 * n)
            out.reserveTriangles(2 * n)

            let lastIndex = if pathType == .closed {
                n
            } else {
                n - 1
            }

            for i in 0..<lastIndex {
                out.addTriangle(
                    a: UInt32(idx + (2 * i + 0) % (2 * n)), 
                    b: UInt32(idx + (2 * i + 1) % (2 * n)), 
                    c: UInt32(idx + (2 * i + 2) % (2 * n)))

                out.addTriangle(
                    a: UInt32(idx + (2 * i + 2) % (2 * n)), 
                    b: UInt32(idx + (2 * i + 3) % (2 * n)), 
                    c: UInt32(idx + (2 * i + 4) % (2 * n)))
            }

            let thinLine = stroke.width <= feathering
            if thinLine {
                let radius = feathering / 2.0
                let color = mul_color(color: stroke.color, factor: stroke.width / feathering)
                if color == .transparent {
                    return
                }

                for p in path {
                    out.coloredVertex(pos: p.pos + radius * p.normal, color: stroke.color)
                    out.coloredVertex(pos: p.pos - radius * p.normal, color: stroke.color)
                }
            } else {
                let radius = stroke.width / 2.0
                for p in path {
                    out.coloredVertex(pos: p.pos + radius * p.normal, color: stroke.color)
                    out.coloredVertex(pos: p.pos - radius * p.normal, color: stroke.color)
                }
            }



        }

         
    }

    internal static func mul_color(color: Color32, factor: Float32) -> Color32 {
        // The fast gamma-space multiply also happens to be perceptually better.
        // Win-win!
        color.gammaMultiply(factor: factor) 
    }
}