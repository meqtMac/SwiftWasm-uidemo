//
//  Stats.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import Foundation

// Size of the elements in a vector/array.
enum ElementSize: Equatable {
    case unknown
    case homogeneous(Int)
    case heterogenous
}

extension ElementSize {
    static var `default`: Self { .unknown }
}

// Aggregate information about a bunch of allocations.
public struct AllocInfo: Equatable {
    var elementSize: ElementSize
    var numAllocs: Int
    var numElements: Int
    var numBytes: Int
    
    init() {
        self.elementSize = .unknown
        self.numAllocs = 0
        self.numElements = 0
        self.numBytes = 0
    }
    
    init(elementSize: ElementSize, numAllocs: Int, numElements: Int, numBytes: Int) {
        self.elementSize = elementSize
        self.numAllocs = numAllocs
        self.numElements = numElements
        self.numBytes = numBytes
    }
}

extension AllocInfo {
    init<T>(slice: [T]) {
        let elementSize = MemoryLayout<T>.size
        self.elementSize = .homogeneous(elementSize)
        self.numAllocs = 1
        self.numElements = slice.count
        self.numBytes = MemoryLayout<T>.stride * slice.count
    }
}

extension AllocInfo {
    static func + (lhs: AllocInfo, rhs: AllocInfo) -> AllocInfo {
        // Implementation of addition...
        let elementSize: ElementSize = switch (lhs.elementSize, rhs.elementSize) {
        case (.heterogenous, _), (_, .heterogenous):
                .heterogenous
        case let (.unknown, other):
            other
        case let (other, .unknown):
            other
        case let (.homogeneous(l), .homogeneous(r) ):
            if l == r {
                .homogeneous(l)
            } else {
                .heterogenous
            }
        }
        
        return AllocInfo(
            elementSize: elementSize,
            numAllocs: lhs.numAllocs + rhs.numAllocs,
            numElements: lhs.numElements + rhs.numElements,
            numBytes: lhs.numBytes + rhs.numBytes)
    }
    
    static func += (lhs: inout AllocInfo, rhs: AllocInfo) {
        lhs = lhs + rhs
    }
    
    //    static func sum<I: IteratorProtocol>(iter: I) -> AllocInfo where I.Element == AllocInfo {
    //        // Implementation of sum...
    //    }
}

public extension AllocInfo {
    // TODO: - impl
    //    func numElements() -> Int {
    //        assert(self.elementSize != .heterogenous)
    //        return self.numElements
    //    }
    //
    //    func numAllocs() -> Int {
    //        return self.numAllocs
    //    }
    //
    //    func numBytes() -> Int {
    //        return self.numBytes
    //    }
    
    //    func
    
    //    func megabytes() -> String {
    //        // Implementation of megabytes...
    //    }
    //
    //    func format(_ what: String) -> String {
    //        // Implementation of format...
    //    }
}

// Collected allocation statistics for shapes and meshes.
struct PaintStats {
    var shapes: AllocInfo
    var shapeText: AllocInfo
    var shapePath: AllocInfo
    var shapeMesh: AllocInfo
    var shapeVec: AllocInfo
    var numCallbacks: Int
    var textShapeVertices: AllocInfo
    var textShapeIndices: AllocInfo
    var clippedPrimitives: AllocInfo
    var vertices: AllocInfo
    var indices: AllocInfo
    
    init(shapes: AllocInfo, shapeText: AllocInfo, shapePath: AllocInfo, shapeMesh: AllocInfo, shapeVec: AllocInfo, numCallbacks: Int, textShapeVertices: AllocInfo, textShapeIndices: AllocInfo, clippedPrimitives: AllocInfo, vertices: AllocInfo, indices: AllocInfo) {
        self.shapes = shapes
        self.shapeText = shapeText
        self.shapePath = shapePath
        self.shapeMesh = shapeMesh
        self.shapeVec = shapeVec
        self.numCallbacks = numCallbacks
        self.textShapeVertices = textShapeVertices
        self.textShapeIndices = textShapeIndices
        self.clippedPrimitives = clippedPrimitives
        self.vertices = vertices
        self.indices = indices
    }
    
    init() {
        self.shapes = AllocInfo()
        self.shapeText = AllocInfo()
        self.shapePath = AllocInfo()
        self.shapeMesh = AllocInfo()
        self.shapeVec = AllocInfo()
        self.numCallbacks = 0
        self.textShapeVertices = AllocInfo()
        self.textShapeIndices = AllocInfo()
        self.clippedPrimitives = AllocInfo()
        self.vertices = AllocInfo()
        self.indices = AllocInfo()
    }
}

extension PaintStats {
    init(shapes: [ClippedShape]) {
        var stats = PaintStats()
        stats.shapePath.elementSize = .heterogenous
        stats.shapeVec.elementSize  = .heterogenous
        stats.shapes = AllocInfo(slice: shapes)
        for clippedShape in shapes {
            stats.add(clippedShape.shape)
        }
        self = stats
    }
    
    mutating func add(_ shape: Shape) {
        //         Implementation of add...
        switch shape {
        case .vec(let shapes):
            // self += PaintStats::from_shapes(&shapes); // TODO(emilk)
            self.shapes += AllocInfo(slice: shapes);
            //                            self.shape_vec += AllocInfo::from_slice(shapes);
            self.shapeVec += AllocInfo(slice: shapes)
            for shape in shapes {
                self.add(shape);
                
            }
            
        case .noop,
                .circle(_),
                .ellipse(_),
                .lineSegment(points: _, stroke: _),
                .rect(_),
                .cubicBezier(_),
                .quadraticBezier(_):
            return
        case let .path(pathShape):
            self.shapePath = AllocInfo(slice: pathShape.points)
        case let .text(textShape):
            // TODO: text
            //
            fatalError()
        case let .mesh(mesh):
            //            self.shapeMesh += AllocInfo(slice: )
            // TODO: mesh
            fatalError()
        case .callback(_):
            self.numCallbacks += 1
        }
    }
    
    mutating func withClippedPrimitives(_ clippedPrimitives: [ClippedPrimitive]) -> PaintStats {
        // Implementation of withClippedPrimitives...
        
        self.clippedPrimitives += AllocInfo(slice: clippedPrimitives)
        for clipped in clippedPrimitives {
            if case let .mesh(mesh) = clipped.primitive {
                self.vertices += AllocInfo(slice: mesh.vertices);
                self.indices += AllocInfo(slice: mesh.indices);
            }
        }
        
        return self
    }
}

//func megabytes(size: Int) -> String {
//    // Implementation of megabytes...
//}
//
