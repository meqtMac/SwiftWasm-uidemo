//
//  UIManager.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import DOM
import RefCount

public struct UIManager: UIManagerInterface {
    @Arc
    var drawingManager: DrawingManager
    
    @Arc
    var eventManager: EventManager
    
    
    private init(view: DRView) {
        @Arc
        var canvas = Canvas(width: UInt32(globalThis.innerWidth), height: UInt32(globalThis.innerHeight))
        _ = globalThis.document.body?.appendChild(node: canvas.element)
        
        @Arc
        var rootView = RootView.rootView(on: canvas, view: view)
        
        _drawingManager = Arc(wrappedValue: DrawingManager(canvas: $canvas, rootView: $rootView))
        _eventManager = Arc(wrappedValue: EventManager(canvas: $canvas, rootView: $rootView))
    }
    
    public mutating func invalidate() {
        drawingManager.setInvalidate()
    }
    
    static var uiManager: Arc<Self>?
    
    public static var main: UIManagerInterface {
        uiManager!
    }
    static func start(view: consuming DRView) {
        var manager = UIManager(view: view)
        manager._drawingManager.start()
        manager._eventManager.addEvent()
        
        uiManager = Arc(wrappedValue: manager)
    }
    
}

extension Arc: UIManagerInterface where Value == UIManager {
    public mutating func invalidate() {
        self.wrappedValue.invalidate()
    }
}

public protocol UIManagerInterface {
    mutating func invalidate()
}
