//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/3.
//

import Foundation
import JavaScriptKit
import DOM

struct BouncingView: HTMDSL {
    let element: HTMLButtonElement
    
    class Ball {
        var x: Double
        var y: Double
        var vx: Double
        var vy: Double
        let radius: Double
        let color: JSColor
        
        func draw(on context: CanvasRenderingContext2D) {
            context.beginPath()
            context.arc(x: x, y: y, radius: radius, startAngle: 0, endAngle: .pi * 2, counterclockwise: true)
            context.closePath()
            context.setFillStyle( color)
            context.fill()
        }
        init(x: Double, y: Double, vx: Double, vy: Double, radius: Double, color: JSColor) {
            self.x = x
            self.y = y
            self.vx = vx
            self.vy = vy
            self.radius = radius
            self.color = color
        }
    }
    
    init(title: String, parent: HTMLElement ) {
        self.element = Button(title: "Transforms") {
            parent.jsObject.innerHTML = ""
            let width = 800, height = 600
            let canvas = Canvas(width: UInt32(width), height: UInt32(height))
            let context = canvas.context
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
            let ball = Ball(x: 100, y: 200, vx: 5, vy: 0, radius: 25, color: .blue)
            var ref: UInt32?
            var running = false
            
            func clear(on context: CanvasRenderingContext2D) {
                context.setFillStyle( JSColor.rgba(255, 255, 255, 0.3))
                context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Double(canvas.element.width), height: Double(canvas.element.height))))
            }
            
            func draw(ball: Ball, on context: CanvasRenderingContext2D) {
                context.setFillStyle( JSColor.rgba(255, 255, 255, 0.3))
                context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Double(canvas.element.width), height: Double(canvas.element.height))))
                
                ball.draw(on: context)
                ball.x += ball.vx
                ball.y += ball.vy
                ball.vy += 1
                
                if (ball.y + ball.vy + ball.radius > Double(canvas.element.height) || ball.y + ball.vy < ball.radius) {
                    ball.vy = -ball.vy
                }
                if (ball.y + ball.radius > Double(canvas.element.height)) {
                    ball.y = Double(canvas.element.height) - ball.radius
                }
                if (ball.y < ball.radius) {
                    ball.y = ball.radius
                }
                
                if (ball.x + ball.vx + ball.radius > Double(canvas.element.width) || ball.x + ball.vx < ball.radius) {
                    ball.vx = -ball.vx
                }
                if (ball.x + ball.radius > Double(canvas.element.width)) {
                    ball.x = Double(canvas.element.width) - ball.radius
                }
                if (ball.x < ball.radius) {
                    ball.x = ball.radius
                }
 
                
                ref = globalThis.requestAnimationFrame { [context] _ in
                    draw(ball: ball, on: context)
                }
            }
            
            canvas.element.addEventListener(type: "mousemove") { event in
                if (!running) {
                    let mouseEvent = MouseEvent(unsafelyWrapping: event.jsObject)
                    clear(on: context)
                    ball.x = Double(mouseEvent.clientX);
                    ball.y = Double(mouseEvent.clientY);
                    ball.draw(on: context)
               }
            }
            
           canvas.element.addEventListener(type: "click") { _ in
                if (!running) {
                    ref = globalThis.requestAnimationFrame { _ in
                        draw(ball: ball, on: context)
                    }
                    running = true
                }
            }
            
            canvas.element.addEventListener(type: "mouseout") { event in
                guard let ref else { return }
                globalThis.cancelAnimationFrame(handle: ref)
                running = false
            }
            
            ball.draw(on: canvas.context)
            
        }.element
    }
}

