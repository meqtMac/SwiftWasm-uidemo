//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/30.
//

@usableFromInline
final internal class MutableReference<T> {
    
    @usableFromInline
    internal var value: T
    
    @usableFromInline
    init(value: consuming T) {
        self.value = value
    }
}

@usableFromInline
final internal class MutableWeakReference<T> {
    
    @usableFromInline
    internal weak var ref: MutableReference<T>?
    
    @usableFromInline
    init(ref: MutableReference<T>? = nil) {
        self.ref = ref
    }
    
    @usableFromInline
    var value: T? {
        get {   ref?.value }
        set {
            guard let newValue else {
                ref = nil
                return
            }
            guard let ref else {
                #if DEBUG
                assertionFailure("Can't assign value to invalid ref")
                #endif
                return
            }
            ref.value = newValue
        }
    }
}
