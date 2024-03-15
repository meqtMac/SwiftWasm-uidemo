//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import JavaScriptKit
import WebAPIBase

fileprivate var uiManager: UIManager?

class UIManager: UIManagerInterface {
    private let drawingManager: DrawingManager
    private let eventManager: EventManager
    private init(view: DRView) {
        let canvas = Canvas(width: UInt32(globalThis.innerWidth), height: UInt32(globalThis.innerHeight))
        _ = document.body?.appendChild(node: canvas.element)
 
        let rootView = RootView.rootView(on: canvas, view: view)
        self.drawingManager = DrawingManager(canvas: canvas, rootView: rootView)
        self.eventManager = EventManager(canvas: canvas, rootView: rootView)
    }
    
    func invalidate() {
        drawingManager.setInvalidate()
    }
    
    static var main: UIManagerInterface {
        let impl = UIManagerImplementation(manager: uiManager)
        return impl
    }
    
    static func start(view: DRView) {
        uiManager = UIManager.init(view: view)
    }
}

protocol UIManagerInterface {
    func invalidate()
}

fileprivate class UIManagerImplementation: UIManagerInterface {
    var manager: UIManager?
    init(manager: UIManager? = nil) {
        self.manager = manager
    }
    func invalidate() {
        if let manager {
            manager.invalidate()
        }
    }
    
}

class DrawingManager {
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



class EventManager {
    private var responser: InteractiveView?
    private var responderOffset: CGPoint = .zero
    private var canvas: Canvas
    private var rootView: RootView
    
    init(canvas: Canvas, rootView: RootView) {
        self.canvas = canvas
        self.rootView = rootView
        
        addEvent()
    }
    
    private func getResponder(event: MouseEvent) -> ViewWithOffset {
        // rootView doesn't respond to event.
        return rootView.responderSubView(for: CGPoint(x: CGFloat(event.clientX), y: CGFloat(event.clientY)))
    }
    
    private func addEvent() {
        canvas.element.addEventListener(type: "mousedown") { [self] event in
            guard let event = MouseEvent(from: event.jsValue) else {
                return
            }
            print("mousedown: \(#file), \(#line), \(JSDate())")
 
            (self.responser, self.responderOffset) = self.getResponder(event: event)
            
            if let responser {
                responser.touchBegin(with: CGPoint(x: CGFloat(event.clientX) - responderOffset.x , y: CGFloat(event.clientY) - responderOffset.y))
            }
        }
        
        canvas.element.addEventListener(type: "mousemove") { [self] event in
//            print("mousemove: \(#file), \(#line), \(JSDate())")
            guard let event = MouseEvent(from: event.jsValue) else {
                return
            }
            
            // TODO: window event listener
            if let responser {
                responser.touchMove(with: CGPoint(x: CGFloat(event.clientX) - responderOffset.x, y: CGFloat(event.clientY) - responderOffset.y))
            }
        }
        
        canvas.element.addEventListener(type: "mouseup") { [self] event in
            guard let event = MouseEvent(from: event.jsValue) else {
                return
            }
            
            if let responser {
                responser.touchEnd(with: CGPoint(x: CGFloat(event.clientX) - responderOffset.x, y: CGFloat(event.clientY) - responderOffset.y))
            }
            self.responser = nil
            self.responderOffset = .zero
        }
        
    }
}



