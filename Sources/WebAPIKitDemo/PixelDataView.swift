//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/3.
//

import Foundation
import DOM
import JavaScriptKit
import WebAPIBase


struct PixelDataView: HTMDSL {
    let element: HTMLButtonElement
   
    private static func pick(with event: MouseEvent, destinationCanvas: HTMLCanvasElement, on canvasObject: HTMLCanvasElement) {
        let bounding = canvasObject.getBoundingClientRect()
        let x = event.clientX - Int32(bounding.left)
        let y = event.clientY - Int32(bounding.top)
        let pixel = canvasObject.getContext(CanvasRenderingContext2D.self)?.getImageData(sx: x, sy: y, sw: 1, sh: y)
        guard let data = pixel?.data else {
            console.error(data: "can't get data")
            return
        }
        
        let color: JSColor = .rgba(data[0], data[1], data[2], Double(data[3]) / 255)
        let context = destinationCanvas.getContext(CanvasRenderingContext2D.self)
        context?.clear(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Double(destinationCanvas.width), height: Double(destinationCanvas.height))))
        
        
        context?.setFillStyle( JSColor.rgba(0, 0, 0, 0.8))
        context?.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Double(destinationCanvas.width), height: Double(destinationCanvas.height))))
        
        context?.setFillStyle( color)
        let padding: Double = 20
        context?.fill(rect: CGRect(origin: CGPoint(x: padding, y: padding), size: CGSize(width: Double(destinationCanvas.width) - 2 * padding, height: Double(destinationCanvas.height) - 2 * padding)))
    }
    
    init(parent: HTMLElement) {
        self.element = Button(title: "Pixel") {
            parent.removeChilds()
            let width: Int32 = 600, height: Int32 = 600
            let canvas = Canvas(width: UInt32(width), height: UInt32(height))
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
            
            let canvas01 = Canvas(width: 200, height: UInt32(height))
            _ = parent.jsValue.appendChild(canvas01.element.jsValue)
            let canvas02 = Canvas(width: 200, height: UInt32(height))
            _ = parent.jsValue.appendChild(canvas02.element.jsValue)
            
            
            drawCircles(on: canvas.context)
            
            canvas.element.addEventListener(type: "mousemove") { e in
                let mouseEvent = MouseEvent(unsafelyWrapping: e.jsObject)
                PixelDataView.pick(with: mouseEvent, destinationCanvas: canvas01.element, on: canvas.element)
            }
            
            canvas.element.addEventListener(type: "click") { event in
                let mouseEvent = MouseEvent(unsafelyWrapping: event.jsObject)
                PixelDataView.pick(with: mouseEvent, destinationCanvas: canvas02.element, on: canvas.element)
            }
        }.element
    }
}

func drawCircles(on context: CanvasRenderingContext2D) {
            let radgrad: CanvasGradient  = context.createRadialGradient(x0: 180, y0: 180, r0: 40, x1: 208, y1: 200, r1: 120) {
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
    context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
    context.setFillStyle( radgrad2)
    context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
    context.setFillStyle( radgrad)
    context.fill(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 600)))
}

struct GrayScaleView: HTMDSL {
    let element: HTMLButtonElement
    static let width: Int32 = 600
    static let height: Int32 = 600
   
    private static func gray(on context: CanvasRenderingContext2D, with data: [UInt8]) {
        var new = [UInt8](repeating: 0, count: data.count)
        for i in 0..<data.count/4 {
            let average = UInt8( (Double(data[i*4]) + Double(data[i*4 + 1]) + Double(data[i*4 + 2])) / 3)
            new[i*4] = average
            new[i*4+1] = average
            new[i*4+2] = average
            new[i*4+3] = data[i*4+3]
        }
        context.putImageData(imagedata: .init(data: new, sw: UInt32(width)), dx: 0, dy: 0)
    }
    
    private static func invert(on context: CanvasRenderingContext2D, with data: [UInt8]) {
        let inverted = data.enumerated().map { i, element in
            return (i+1) % 4 == 0 ? element : 255 - element
        }
        context.putImageData(imagedata: .init(data: inverted, sw: UInt32(width)), dx: 0, dy: 0)
    }
    
    private static func revert(on context: CanvasRenderingContext2D, with original: [UInt8]) {
        context.putImageData(imagedata: .init(data: original, sw: UInt32(width)), dx: 0, dy: 0)
    }
    
    init(title: String = "GrayScaling", parent: HTMLElement) {
        self.element = Button(title: title) {
            parent.jsObject.innerHTML = ""
            let canvas = Canvas(width: UInt32(Self.width), height: UInt32(Self.height))
            let context = canvas.context
            
            drawCircles(on: canvas.context)
            let originalData = [UInt8](with: canvas.context.getImageData(sx: 0, sy: 0, sw: Self.width, sh: Self.height).data)
            
            let div = Div {
                Button(title: "Gray") { [context] in
//                    guard let context else { return }
                    Self.gray(on: context, with: originalData)
                }
                Button(title: "invert") { [context] in
//                    guard let context else { return }
                    Self.invert(on: context, with: originalData)
                }
                 Button(title: "revert") { [context] in
//                    guard let context else { return }
                     Self.revert(on: context, with: originalData)
                }
            }
            _ = parent.jsValue.appendChild(div.element.jsValue)
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
       }.element
    }
}

extension ImageData {
    convenience init(data: [UInt8], sw: UInt32) {
        self.init(data: .init(slowly: data), sw: sw)
    }
}

extension JSUInt8ClampedArray {
    convenience init(slowly array: [UInt8]) {
        self.init(length: array.count)
        for i in 0..<array.count {
            self[i] = array[i]
        }
    }
}

extension Array where Element == UInt8 {
    init(with jsArray: JSUInt8ClampedArray ) {
        self.init(unsafeUninitializedCapacity: jsArray.lengthInBytes) { buffer, initializedCount in
            initializedCount = jsArray.lengthInBytes
            _ = jsArray.withUnsafeBytes { ptr in
               buffer.moveInitialize(fromContentsOf: UnsafeMutableBufferPointer(mutating: ptr))
            }
        }
   }
}
