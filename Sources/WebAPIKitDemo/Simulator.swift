////
////  Simulator.swift
////
////
////  Created by 蒋艺 on 2024/3/14.
////
//
//import Foundation
//import DOM
//import JavaScriptKit
//import WebAPIBase
//
//
//class Simulator {
//    private var canvas: Canvas
//    private let rootView: RootView
//    private let demoView: DemoView
//    init(canvas: Canvas) {
//        self.canvas = canvas
//        let demoView = DemoView(frame: .init(origin: .init(x: 0, y: 0), size: .init(width: 0, height: 0)), backgroundColor: .rgba(0, 0, 0, 0))
//        let rootView = RootView.rootView(on: canvas, view: demoView)
//        self.demoView = demoView
//        self.rootView = rootView
//        self.setupEvent()
//        
//        self.draw()
//        self.start()
//    }
//    
//    var isResizing = false
//    var resizeStartX: CGFloat = 0
//    var resizeStartY: CGFloat = 0
//    var initialWidth: CGFloat = 0
//    var initialHeight: CGFloat = 0
//    var rectWidth: CGFloat = 200
//    var rectHeight: CGFloat = 200
//    var rectX: CGFloat = 100
//    var rectY: CGFloat = 100
//    
//    private func setupEvent() {
//        // TODO: Gesture
//        //
//        canvas.element.addEventListener(type: "mousedown") { [self] event in
//            print("mousedown \(JSDate())")
//            guard let event = MouseEvent(from: event.jsValue) else {
//                return
//            }
//            print("mousedown event: \(event) \(JSDate())")
//            
//            let rect = canvas.element.getBoundingClientRect()
//            let mouseX: CGFloat = CGFloat(event.clientX) - CGFloat(rect.left)
//            let mouseY: CGFloat = CGFloat(event.clientY) - CGFloat(rect.top)
//            
//            if (
//                mouseX > rectX + rectWidth - 10 &&
//                mouseY > rectY + rectHeight - 10 &&
//                mouseX < rectX + rectWidth &&
//                mouseY < rectY + rectHeight
//            ) {
//                print("mousedown resizing \(JSDate())")
//                
//                isResizing = true;
//                resizeStartX = mouseX;
//                resizeStartY = mouseY;
//                initialWidth = rectWidth;
//                initialHeight = rectHeight;
//            }
//        }
//        
//        canvas.element.addEventListener(type: "mousemove") { [self] event in
//            
//            guard let event = MouseEvent(from: event.jsValue) else {
//                return
//            }
//            
//            
//            if (isResizing) {
//                print("mousemove resizing \(JSDate())")
//                
//                var rect = canvas.element.getBoundingClientRect()
//                
//                var mouseX = CGFloat(event.clientX) - CGFloat( rect.left )
//                var mouseY = CGFloat(event.clientY) - CGFloat(rect.top)
//                
//                rectWidth = initialWidth + (mouseX - resizeStartX)
//                rectHeight = initialHeight + (mouseY - resizeStartY)
//            }
//            
//        }
//        
//        canvas.element.addEventListener(type: "mouseup") { [self] event in
//            guard let event = MouseEvent(from: event.jsValue) else {
//                return
//            }
//            
//            isResizing = false
//        }
//    }
//    
//    func draw() {
//        // TODO: draw on context
//        demoView.frame.origin.x = 100
//        demoView.frame.origin.y = 0
//        demoView.frame.size.width = currentDevice.size.width
//        demoView.frame.size.height = currentDevice.size.height + 100
//        rootView.draw(on: canvas.context)
//    }
//    
//    var timer: Int32?
//    func start() {
//        
//        guard timer == nil else { return }
//        let this = globalThis.jsObject
//        print("\(this) \(JSDate())")
//        
//        self.timer = this["setInterval"].jsValue.function!(this: this, arguments: [
//            _toJSValue(tickFn), _toJSValue(16)
//        ]).fromJSValue()!
//    }
//    
//    lazy var tickFn = JSClosure { [self] _ in
//        // self.draw won't be called if [weak self]
//        //        if (self.isResizing) {
//        self.draw()
//        //        }
//        return .undefined
//    }
//    
//    func stop() {
//        guard let timer else { return }
//        globalThis.clearInterval(id: timer)
//        self.timer = nil
//    }
//    
//    deinit {
//        stop()
//    }
//}
