//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/31.
//

import Foundation

@propertyWrapper
public struct Rc<Value> {

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

//extension Rc {
//    public func cast<T>() -> Rc<T> where Value: T {
//        
//    }
//}

@propertyWrapper
public struct Weak<Value> {
    public typealias Ref = Rc<Value>

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


