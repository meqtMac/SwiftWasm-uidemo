////
////  HeapStorage.swift
////
////
////  Created by 蒋艺 on 2024/3/30.
////
//
//import Foundation
//
//@propertyWrapper
//public struct Rc<Value>: ~Copyable {
//    
//    @usableFromInline
//    struct Storage {
//        @usableFromInline
//        var count: Int = 0
//        
//        @usableFromInline
//        var value: Value
//        
//        @usableFromInline
//        init(count: Int, value: consuming Value) {
//            self.count = count
//            self.value = value
//        }
//    }
//    
//    @usableFromInline
//    let pointer: Pointer
//    
//    @usableFromInline
//    typealias Pointer = UnsafeMutablePointer<Storage>
//    
//    @inlinable
//    public init(wrappedValue initialValue: consuming Value) {
//        var storage = Storage(count: 1, value: initialValue)
//        pointer = .allocate(capacity: 1)
//        pointer.initialize(to: storage)
//    }
//    
//    @usableFromInline
//    init(pointer: Pointer) {
//        self.pointer = pointer
//    }
//    
//    @inlinable
//    public var wrappedValue: Value {
//        get {
//            assert(pointer.pointee.count > 0, "ref deallocated value")
//            return pointer.pointee.value
//        }
//        mutating set {
//            pointer.pointee.value = newValue
//        }
//    }
//    
//    @usableFromInline
//    var clone: Self {
//        let copy = Self.init(pointer: pointer)
//        copy.pointer.pointee.count += 1
//        return copy
//    }
//    
//    @inlinable
//    public var weak: Weak<Value> {
//        Weak(ref: self)
//    }
//    
//    @inlinable
//    public var projectedValue: Self {
//        self.clone
//    }
//    
//    deinit {
//        pointer.pointee.count -= 1
//        assert(pointer.pointee.count >= 0, "multiple deallocated")
//        if pointer.pointee.count == 0 {
//            pointer.deallocate()
//        }
//    }
//}
//
//@propertyWrapper
//public struct Weak<Value> {
//    public typealias Ref = Rc<Value>
//    
//    @usableFromInline
//    var pointer: Ref.Pointer?
//    
//   @inlinable
//    public init(ref: borrowing Ref) {
//        pointer = ref.pointer
//    }
//    
//    @inlinable
//    public var wrappedValue: Value? {
//        get {
//            guard let pointer else {
//                return nil
//            }
//            if pointer.pointee.count > 0 {
//                return pointer.pointee.value
//            } else {
//                return nil
//            }
//        }
//        mutating set {
//            guard let newValue else {
//                pointer = nil
//                return
//            }
//            guard let pointer else {
//                assertionFailure("Weak Ref is nil")
//                return
//            }
//            pointer.pointee.value = newValue
//        }
//    }
//    
//    @inlinable
//    public var projectedValue: Self {
//        self
//    }
//}
//
//
