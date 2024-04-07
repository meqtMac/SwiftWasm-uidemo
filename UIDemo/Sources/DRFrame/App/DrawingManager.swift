//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import DOM
import JavaScriptKit
import WebAPIBase
import RefCount

internal struct DrawingManager {
    private(set) var invalidate: Bool = true
    
    @Arc
    private var canvas: Canvas
    
    @Arc
    private var rootView: RootView
    
    @Arc
    var timer: Int32? = nil
 
    
    mutating func draw() {
        rootView.draw(on: canvas.context)
        invalidate = false
    }
    
    init(canvas: Arc<Canvas>, rootView: Arc<RootView>) {
        _canvas = canvas
        _rootView = rootView
        
        globalThis.addEventListener(type: "resize") { [canvas] event in
            print("resized")
            canvas.wrappedValue.element.width = UInt32(globalThis.innerWidth)
            canvas.wrappedValue.element.height = UInt32(globalThis.innerHeight)
            var manager = UIManager.main
            manager.invalidate()
        }
    }
    
    //    @Box
    //    private var timer: Int32?
    //
    //    private consuming func start() -> Self {
    //        guard timer == nil else { return self }
    //        let this = globalThis.jsObject
    //        print("\(this) \(JSDate())")
    
    //        @Rc
    //        var painter: DrawingManager; _painter = Rc(wrappedValue: self)
    
    //        lazy var tickFn = JSClosure { [self] _ in
    //            if (self.invalidate) {
    //                self.draw()
    //            }
    //            return .undefined
    //        }
    
    
    //        self.timer = this["setInterval"].jsValue.function!(this: this, arguments: [
    //            _toJSValue(tickFn), _toJSValue(16)
    //        ]).fromJSValue()!
    //    }
    
    
    //    private func stop() {
    //        guard let timer else { return }
    //        globalThis.clearInterval(id: timer)
    //        self.timer = nil
    //    }
    //
    //    deinit {
    //        stop()
    //    }
}

extension DrawingManager {
    mutating func setInvalidate() {
        invalidate = true
    }
    
//    mutating func
}

extension Arc where Value == DrawingManager {
    
    
    mutating func start() {
        
        guard wrappedValue.timer == nil else {
            return
        }
        let this = globalThis.jsObject
        print("\(this) \(JSDate())")
        
        @Weak
        var weakref: Value?; _weakref = self.weak
        console.log(data: "drawing start")
        lazy var tickFn = JSClosure { _ in
           if weakref?.invalidate ?? false  {
               console.log(data: "drawing loop")
                weakref?.draw()
            }
            return .undefined
        }
        
        wrappedValue.timer = this["setInterval"].jsValue.function!(this: this, arguments: [
            _toJSValue(tickFn), _toJSValue(16)
        ]).fromJSValue()!
        
    }
    
    
    mutating func stop() {
        if wrappedValue.timer != nil {
            globalThis.clearInterval(id: wrappedValue.timer)
        }
        wrappedValue.timer = nil
    }
    
}
