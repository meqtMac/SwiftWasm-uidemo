//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//
import Foundation

public protocol DRView: InteractiveView {
    var frame: CGRect { get mutating set }
    var backgroundColor: Color32 { get mutating set }
    mutating func draw(on context: Context2D)
    mutating func layoutSubviews()
    var subviews: [DRViewRef] { get mutating set }
    var hidden: Bool { get mutating set }
}

public protocol DRViewRef {
    var value: DRView { get mutating set }
    var weakRef: WeakDRViewRef { get }
}

public protocol WeakDRViewRef {
    var value: DRView? { get mutating set }
}

extension Rc : DRViewRef where Value: DRView {
    public var weakRef: any WeakDRViewRef {
        return self.weak
    }
   
    public var value: any DRView {
        get {
            self.wrappedValue
        }
        set {
            guard let new = newValue as? Value else {
                assertionFailure("Unmatched type")
                return
            }
            self.wrappedValue = new
        }
    }
}

extension Weak : WeakDRViewRef where Value: DRView {
    public var value: DRView? {
        get {
            self.wrappedValue
        }
        mutating set {
            guard let new = newValue as? Value else {
                self.wrappedValue = nil
                return
            }
            self.wrappedValue = new
        }
    }

}


//extension DRViewRef {
//       @inlinable
//    public var wrappedValue: Value {
//        get {
//            ref.value
//        }
//        mutating set {
//            ref.value = newValue
//        }
//    }
//
//
//}
