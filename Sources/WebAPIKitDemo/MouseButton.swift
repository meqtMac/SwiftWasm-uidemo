//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/2.
//

import Foundation
import JavaScriptKit
import WebAPIBase
import DOM

struct MouseButton: HTMDSL {
    let element: HTMLButtonElement
    init(title: String, parent: HTMLElement ) {
       
        self.element = Button(title: title) {
            parent.removeChilds()
            
            let innerWith = globalThis.innerWidth
            let innerHeight = globalThis.innerHeight
            let canvas = Canvas(width: UInt32(innerWith), height: UInt32(innerHeight) )
            let context = canvas.context
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
            
            context.globalAlpha = 0.5;
            
            var cursor = (x: Double(globalThis.innerWidth / 2), y: Double(globalThis.innerHeight / 2))
            var particles = (0...101).map { _ in
                Particle(x: Double(innerWith/2), y: Double(innerHeight/2), trailWidth: 4, color: generateColor(), rotateSpeed: 0.02)
            }
            
            func generateColor() -> JSColor {
                return .rgb(UInt8.random(in: 0...255),
                            UInt8.random(in: 0...255),
                            UInt8.random(in: 0...255))
            }
            
            struct Particle {
                var x: Double
                var y: Double
                let trailWidth: Double
                let color: JSColor
                let rotateSpeed: Double
                var theta = Double.random(in: 0...(2 * .pi))
                var t = Double.random(in: 0...1) * 150
                mutating func rotate(on context: CanvasRenderingContext2D, with cursor: (x: Double, y: Double)) {
                    let position: (x: Double, y: Double) = (x, y)
                    
                    theta += rotateSpeed
                    x = cursor.x + cos(theta) * t
                    y = cursor.y + sin(theta) * t
                    context.beginPath()
                    context.lineWidth = trailWidth
                    context.setStrokeStyle( color)
                    context.moveTo(x: position.x, y: position.y)
                    context.lineTo(x: x, y: y)
                    context.stroke()
                }
            }
            
            func anim() {
                let _ = globalThis.requestAnimationFrame { _ in
                    anim()
                }
                context.setFillStyle(.rgba(0, 0, 0, 0.05))
                
                context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Double(canvas.element.width), height: Double(canvas.element.height))))
                for i in 0..<particles.count {
                    particles[i].rotate(on: context, with: cursor)
                }
            }
            func resize() {
                canvas.element.height = UInt32(innerHeight)
                canvas.element.width = UInt32(innerWith)
            }
            
            canvas.element.addEventListener(type: "mousemove") { e in
                let mouseEvent = MouseEvent(unsafelyWrapping: e.jsObject)
                cursor.x = mouseEvent.x
                cursor.y = mouseEvent.y
            }
            
            canvas.element.addEventListener(type: "resize") { _ in
                console.log(data: "resized")
                resize()
            }
            
            canvas.element.addEventListener(type: "touchMove") { event in
                console.log(data: "touchmoved")
                let touchEvent = TouchEvent(unsafelyWrapping: event.jsObject)
                touchEvent.preventDefault()
                if let x = touchEvent.touches[0]?.clientX, let y = touchEvent.touches[0]?.clientY {
                    cursor.x = x
                    cursor.y = y
                }
                
            }
            anim();
        }.element
    }

}
