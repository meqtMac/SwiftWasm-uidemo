//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/31.
//

import Foundation

@propertyWrapper
public struct Rc<Value>: ~Copyable {

    @usableFromInline
    struct Storage {
        @usableFromInline
        var count: Int = 0

        @usableFromInline
        var value: Value

        @usableFromInline
        init(count: Int, value: consuming Value) {
            self.count = count
            self.value = value
        }
    }

    @usableFromInline
    let pointer: Pointer

    @usableFromInline
    typealias Pointer = UnsafeMutablePointer<Storage>

    @inlinable
    public init(wrappedValue initialValue: consuming Value) {
        let storage = Storage(count: 1, value: initialValue)
        pointer = .allocate(capacity: 1)
        pointer.initialize(to: storage)
    }

    @usableFromInline
    init(pointer: Pointer) {
        self.pointer = pointer
    }

    @inlinable
    public var wrappedValue: Value {
        get {
            assert(pointer.pointee.count > 0, "ref deallocated value")
            return pointer.pointee.value
        }
        mutating set {
            pointer.pointee.value = newValue
        }
    }

    @usableFromInline
    var clone: Self {
        let copy = Self.init(pointer: pointer)
        copy.pointer.pointee.count += 1
        return copy
    }

    @inlinable
    public var weak: WeakRc<Value> {
        WeakRc(ref: self)
    }

    @inlinable
    public var projectedValue: Self {
        self.clone
    }

    deinit {
        pointer.pointee.count -= 1
        assert(pointer.pointee.count >= 0, "multiple deallocated")
        if pointer.pointee.count == 0 {
            pointer.deallocate()
        }
    }
}

@propertyWrapper
public struct WeakRc<Value> {
    public typealias Ref = Rc<Value>

    @usableFromInline
    var pointer: Ref.Pointer?

   @inlinable
    public init(ref: borrowing Ref) {
        pointer = ref.pointer
    }

    @inlinable
    public var wrappedValue: Value? {
        get {
            guard let pointer else {
                return nil
            }
            if pointer.pointee.count > 0 {
                return pointer.pointee.value
            } else {
                return nil
            }
        }
        mutating set {
            guard let newValue else {
                pointer = nil
                return
            }
            guard let pointer else {
                assertionFailure("Weak Ref is nil")
                return
            }
            pointer.pointee.value = newValue
        }
    }

    @inlinable
    public var projectedValue: Self {
        self
    }
}

@propertyWrapper
public struct Arc<Value> {

    @usableFromInline
    let ref: Reference

    @usableFromInline
    typealias Reference = MutableReference<Value>

    @inlinable
    public init(wrappedValue initialValue: consuming Value) {
        ref = Reference(value: initialValue)
    }

    @usableFromInline
    init(ref: Reference) {
        self.ref = ref
    }

    @inlinable
    public var wrappedValue: Value {
        get {
            ref.value
        }
        mutating set {
            ref.value = newValue
        }
    }

    @inlinable
    public var clone: Self {
        let copy = Self.init(ref: self.ref)
        return copy
    }

    @inlinable
    public var weak: Weak<Value> {
        Weak(rc: self)
    }

    @inlinable
    public var projectedValue: Self {
        self.clone
    }
}

/// Weak Arc
@propertyWrapper
public struct Weak<Value> {
    public typealias Ref = Arc<Value>

    @usableFromInline
    var ref: Ref.Reference?

    @inlinable
    public init(rc ref: borrowing Ref) {
        self.ref = ref.ref
    }
    
    @usableFromInline
    init(ref: Ref.Reference?) {
        self.ref = ref
    }
    
    @inlinable
    public init(weak ref: Self?) {
        self.ref = ref?.ref
    }

    @inlinable
    public var wrappedValue: Value? {
        get {
           guard let ref else {
                return nil
            }
            return ref.value
        }
        mutating set {
            guard let newValue else {
                ref = nil
                return
            }
            guard let ref else {
                assertionFailure("Weak Ref is nil")
                return
            }
            ref.value = newValue
        }
    }

    @inlinable
    public var projectedValue: Self {
        self
    }
    
    @inlinable
    public var `nil`: Self {
        .init(weak: nil)
    }
    
    @inlinable
    public var isNil: Bool {
        return ref == nil
    }
}


