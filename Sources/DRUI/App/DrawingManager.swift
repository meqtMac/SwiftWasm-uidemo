//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

//import Foundation
import DOM
import JavaScriptKit
import WebAPIBase

internal class DrawingManager {
    private var invalidate: Bool = true
    private let canvas: Canvas
    private let rootView: RootView
    
    private func draw() {
        rootView.draw(on: canvas.context)
    }
    
    init(canvas: Canvas, rootView: RootView) {
        self.canvas = canvas
        self.rootView = rootView
        self.start()
        
        globalThis.addEventListener(type: "resize") { event in
            print("resized")
            canvas.element.width = UInt32(globalThis.innerWidth)
            canvas.element.height = UInt32(globalThis.innerHeight)
        }
    }
    
    private var timer: Int32?
    private func start() {
        guard timer == nil else { return }
        let this = globalThis.jsObject
        print("\(this) \(JSDate())")
        
        self.timer = this["setInterval"].jsValue.function!(this: this, arguments: [
            _toJSValue(tickFn), _toJSValue(16)
        ]).fromJSValue()!
    }
    
    private lazy var tickFn = JSClosure { [self] _ in
        if (self.invalidate) {
            self.draw()
        }
        return .undefined
    }
    
    private func stop() {
        guard let timer else { return }
        globalThis.clearInterval(id: timer)
        self.timer = nil
    }
    
    deinit {
        stop()
    }
}

extension DrawingManager {
    func setInvalidate() {
        invalidate = true
    }
}
