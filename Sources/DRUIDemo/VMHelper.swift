//
//  VMHelper.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DRUI

protocol VMView: DRView {
    associatedtype ViewModel
    var viewModel: ViewModel { get set }
//    func bindViewModel(_ newViewModel: ViewModel)
}

// TODO: replace with full-fledged Reactive Framework
@propertyWrapper
struct VMObservable<Value> {
    private var value: Value
    private let observers = Observers<Value>()
    
    private class Observers<ObserableValue> {
        private var innerObservers = [(ObserableValue) -> Void]()
        
        func notifyObservers( newValue: ObserableValue) {
            innerObservers.forEach { observer in
                observer(newValue)
            }
        }
        
        func attach(_ observer: @escaping (ObserableValue) -> Void) {
            innerObservers.append(observer)
        }
    }
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Value {
        get {
            value
        }
        set {
            value = newValue
            UIManager.main.invalidate()
            observers.notifyObservers(newValue: newValue)
        }
    }
    
    var projectedValue: VMObservable<Value> {
        self
    }
    
    func observe(_ observer: @escaping (Value) -> Void) {
        observers.attach(observer)
        observer(value)
    }
}
