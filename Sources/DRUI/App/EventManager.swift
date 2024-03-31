//
//  EventManager.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import JavaScriptKit
//import RefCount

internal struct EventManager {
    var response: WeakViewWithOffset
    
    @Rc
    var canvas: Canvas
    
    @Rc
    private var rootView: RootView
    
    init(canvas: Rc<Canvas>, rootView: Rc<RootView>) {
        _canvas = canvas
        _rootView = rootView
        response = (nil, .zero)
    }
    
    mutating func getResponder(event: MouseEvent) {
        response = rootView
            .responderSubView(for: CGPoint(x: CGFloat(event.clientX), y: CGFloat(event.clientY)))
    }
}



extension Rc where Value == EventManager {
    func addEvent() {
        @Weak
        var weakRef: EventManager?; _weakRef = self.weak
        
        self.wrappedValue
            .canvas
            .element
            .addEventListener(type: "mousedown") { event in
                guard let event = MouseEvent(from: event.jsValue) else {
                    return
                }
                
                print("mousedown: \(#file), \(#line))")
                weakRef?.getResponder(event: event)
                console.log(data: "\(weakRef)".jsValue)
                guard var response = weakRef?.response else {
                    return
                }
                console.log(data: "\(response)".jsValue)
 
                response.0?.value?.touchBegin(with: CGPoint(x: CGFloat(event.clientX) - response.1.x , y: CGFloat(event.clientY) - response.1.y))
            }
        
        self.wrappedValue
            .canvas
            .element
            .addEventListener(type: "mousemove") { event in
                guard let event = MouseEvent(from: event.jsValue) else {
                    return
                }
                
                print("mousemove: \(#file), \(#line), \(JSDate())")
                guard var response = weakRef?.response else {
                    return
                }
                response.0?.value?.touchMove(with: CGPoint(x: CGFloat(event.clientX) - response.1.x , y: CGFloat(event.clientY) - response.1.y))
            }
        
        self.wrappedValue
            .canvas
            .element
            .addEventListener(type: "mouseup") { event in
                guard let event = MouseEvent(from: event.jsValue) else {
                    return
                }
                
                print("mouseup: \(#file), \(#line), \(JSDate())")
                guard var response = weakRef?.response else {
                    return
                }
                response.0?.value?.touchEnd(with: CGPoint(x: CGFloat(event.clientX) - response.1.x , y: CGFloat(event.clientY) - response.1.y))
                weakRef?.response = (nil, .zero)
            }
    }
}

