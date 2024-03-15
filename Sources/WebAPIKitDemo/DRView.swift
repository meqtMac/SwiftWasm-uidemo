//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/14.
//

import DOM
import Foundation
protocol InteractiveView {
    var userInteractEnabled: Bool { get set }
    func touchBegin(with point: CGPoint)
    func touchMove(with point: CGPoint)
    func touchEnd(with point: CGPoint)
}

extension InteractiveView {
    func touchBegin(with point: CGPoint) {
        
    }
    
    func touchMove(with point: CGPoint) {
        
    }
    
    func touchEnd(with point: CGPoint) {
        
    }
}

protocol DRView: InteractiveView {
    var frame: CGRect { get set }
    var backgroundColor: JSColor { get set }
    func draw(on context: CanvasRenderingContext2D)
    func layoutSubviews()
    var subviews: [DRView] { get set }
    var hidden: Bool { get set }
}


typealias ViewWithOffset = (InteractiveView?, CGPoint)

extension DRView {
    
    func responderSubView(for point: CGPoint) -> ViewWithOffset {
        for view in subviews.reversed() {
            if !view.hidden && view.userInteractEnabled && view.isPointInView(point: point) {
                return (view, .zero)
            }
            if !view.hidden {
                let (subView, offset) = view.responderSubView(for: CGPoint(x: point.x - view.left, y: point.y - view.top))
                if let subView {
                    return (subView, CGPoint(x: offset.x + view.left, y: offset.y + view.top) )
                }
            }
        }
        return (nil, .zero)
    }
    
    @usableFromInline
    func isPointInView(point: CGPoint) -> Bool {
        return frame.left <= point.x && frame.right >= point.x && frame.top <= point.y && frame.bottom >= point.y
    }
    
    func draw(on context: CanvasRenderingContext2D) {
        // Default do nothing
    }
    
    func layoutSubviews() {
        // Default do nothing
    }
    
    func drawSubviews(on context: CanvasRenderingContext2D) {
        layoutSubviews()
        context.save()
        context.translate(x: frame.origin.x, y: frame.origin.y)
        for subview in self.subviews {
            if subview.hidden {
                continue
            }
            subview.draw(on: context)
            subview.drawSubviews(on: context)
        }
        context.restore()
    }
    
    mutating func addSubview(_ view: some DRView) {
        subviews.append(view)
    }
 
}


class RootView: DRView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: DOM.JSColor
    var subviews: [DRView]
    
    init(frame: CGRect, subviews: [DRView]) {
        self.frame = frame
        self.backgroundColor = .rgba(0, 0, 0, 0)
        self.subviews = subviews
    }
    
    static func rootView(on canvas: Canvas, view: DRView) -> RootView {
        let rootView = RootView(frame: CGRect(origin: .init(x: 0, y: 0), size: CGSize(width: CGFloat(canvas.element.width), height: CGFloat(canvas.element.height))), subviews: [view])
        return rootView
    }
    
   
    func draw(on context: CanvasRenderingContext2D) {
        context.imageSmoothingEnabled = false
        self.frame = CGRect(origin: .zero, size: CGSize(width: CGFloat(context.canvas.width), height: CGFloat(context.canvas.height)))
        
        context.clear(rect: frame)
        context.save()
        context.setFillStyle(backgroundColor)
        context.fill(rect: frame)
        context.restore()
        
        drawSubviews(on: context)
    }
}

protocol RectView: DRView {
}

extension RectView {
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.setFillStyle(backgroundColor)
        context.fill(rect: self.frame)
        context.restore()
    }
}

protocol CapsuleView: DRView {
}

extension CapsuleView {
        func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.setFillStyle(backgroundColor)
        let radius = min(frame.size.width, frame.size.height) / 2
        context.beginPath()
        context.moveTo(x: frame.origin.x + radius, y: frame.origin.y)
        context.lineTo(x: self.right - radius, y: top)
        context.arc(x: self.right - radius, y: self.top + radius, radius: radius, startAngle: 0, endAngle: 90)
        context.lineTo(x: self.right, y: self.bottom - radius)
        context.arc(x: self.right - radius, y: self.bottom - radius, radius: radius, startAngle: 90, endAngle: 180)
        context.lineTo(x: self.left + radius, y: self.bottom)
        context.arc(x: self.left + radius, y: self.bottom - radius, radius: radius, startAngle: 180, endAngle: 270)
        context.lineTo(x: self.left, y: self.top + radius)
        context.arc(x: self.left + radius, y: self.top + radius, radius: radius, startAngle: 270, endAngle: 360)
        context.closePath()
        context.fill()
        context.restore()
    }

}

//            print("mousedown mouseX: \(mouseX) \(JSDate())")
//            print("mousedown mouseY: \(mouseY) \(JSDate())")
//           print("mousedown rect: \(rect) \(JSDate())")
            
//class DemoView: DRView {
//    // Existing code...
//    
//    var userInteractionEnabled: Bool = true
//    var onClick: ((CGPoint) -> Void)?
//    
//    // Implement the handleMouseEvent method
//    func handleMouseEvent(event: MouseEvent) {
//        guard userInteractionEnabled else {
//            return
//        }
//        
//        // Handle the mouse event here
//        // You can access the event properties like event.x, event.y, and event.type
//    }
//}
//protocol InteractiveView {
   
//    // Implement the handleMouseEvent method
//    func handleMouseEvent(event: MouseEvent) {
//        guard userInteractionEnabled else {
//            return
//        }
//        
//        // Handle the mouse event here
//        // You can access the event properties like event.x, event.y, and event.type
//    }
//}

//extension DRView: InteractiveView {
//    var u
//}
