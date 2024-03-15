//
//  EventManager.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import JavaScriptKit

internal class EventManager {
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



