//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/3.
//

//import Foundation
import DOM
import JavaScriptKit
import WebAPIBase
import Foundation

struct ZoomingView: HTMDSL {
    let element: HTMLButtonElement
    
    private static func draw(on context: CanvasRenderingContext2D) {
        let radgrad  = context.createRadialGradient(x0: 180, y0: 180, r0: 40, x1: 208, y1: 200, r1: 120) {
            (offset: 0, color: .rgb(0xa7, 0xd3, 0xc))
            (offset: 0.9, color: .rgb(1, 0x9f, 0x62))
            (offset: 1, color: .rgba(1, 159, 98, 0))
        }
        
        let radgrad2 = context.createRadialGradient(x0: 420, y0: 420, r0: 80, x1: 448, y1: 480, r1: 200) {
            (offset: 0, color: .rgb(0xff, 0x5f, 0x98))
            (offset: 0.75, color: .rgb(0xff, 1, 0x88))
            (offset: 1, color: .rgba(255, 1, 136, 0))
        }
        
        let radgrad3 = context.createRadialGradient(x0: 380, y0: 60, r0: 60, x1: 408, y1: 80, r1: 160) {
            (offset: 0, color: .rgb(0, 0xc9, 0xff))
            (offset: 0.8, color: .rgb(0, 0xb5, 0xe2))
            (offset: 1, color: .rgba(0, 201, 255, 0))
        }
        
        let radgrad4 = context.createRadialGradient(x0: 0, y0: 600, r0: 200, x1: 0, y1: 560, r1: 360) {
            (offset: 0, color: .rgb(0xf4, 0xf2, 1))
            (offset: 0.8, color: .rgb(0xe4, 0xc7, 0))
            (offset: 1, color: .rgba(228, 199, 0, 0))
        }
        
        context.setFillStyle( radgrad4)
        context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
        context.setFillStyle( radgrad3)
        
        context.setFillStyle( radgrad2)
        context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
        
        context.setFillStyle( radgrad)
        context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
        
    }
    
    init(title: String, parent: HTMLElement) {
        self.element = Button(title: title) {
            parent.removeChilds()
            let width: Int32 = 600, height: Int32 = 600
            let canvas = Canvas(width: UInt32(width), height: UInt32(height))
            let smoothingZoomCanvas = Canvas(width: 200, height: 200)
            let pixelatedZoomCanvas = Canvas(width: 200, height: 200)
            let div = Div {
                canvas
                smoothingZoomCanvas
                pixelatedZoomCanvas
            }
            
            Self.draw(on: canvas.context)
            let originalData = canvas.context.getImageData(sx: 0, sy: 0, sw: width, sh: height)
            canvas.context.putImageData(imagedata: originalData, dx: 0, dy: 0)
            
            smoothingZoomCanvas.context.imageSmoothingEnabled = true
            pixelatedZoomCanvas.context.imageSmoothingEnabled = false
            
            func zoom(on context: CanvasRenderingContext2D, source: HTMLCanvasElement, x: Double, y: Double) {
                context.drawImage(image: source,
                                  sx: min(max(0, x - 5), Double(width) - 10),
                                  sy: min(max(0, y - 5), Double(height) - 10),
                                  sw: 10,
                                  sh: 10,
                                  dx: 0,
                                  dy: 0,
                                  dw: 200,
                                  dh: 200)
            }
            
            _ = parent.jsValue.appendChild(div.element.jsValue)
            
            canvas.element.addEventListener(type: "mousemove") { event in
                console.log(data: "mouse move")
                let mouseEvent = MouseEvent(unsafelyWrapping: event.jsObject)
                let x = Double(mouseEvent.clientX - canvas.element.offsetLeft)
                let y = Double(mouseEvent.clientY - canvas.element.offsetTop)
                zoom(on: smoothingZoomCanvas.context, source: canvas.element, x: x, y: y)
                zoom(on: pixelatedZoomCanvas.context, source: canvas.element, x: x, y: y)
            }
            
        }.element
        
    }
}
