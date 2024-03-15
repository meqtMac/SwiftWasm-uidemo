//
//  UIManager.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

//import Foundation
import DOM

fileprivate var uiManager: UIManager?

class UIManager: UIManagerInterface {
    private let drawingManager: DrawingManager
    private let eventManager: EventManager
    private init(view: DRView) {
        let canvas = Canvas(width: UInt32(globalThis.innerWidth), height: UInt32(globalThis.innerHeight))
        _ = globalThis.document.body?.appendChild(node: canvas.element)
 
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
