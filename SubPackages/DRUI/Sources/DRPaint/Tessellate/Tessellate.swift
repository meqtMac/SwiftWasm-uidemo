//
//  Tessellate.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor


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
