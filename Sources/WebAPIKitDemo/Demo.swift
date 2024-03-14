import DOM
import JavaScriptKit
import WebAPIBase
import Foundation

protocol DRView {
    var frame: CGRect { get set }
    var backgroundColor: JSColor { get set }
    func draw(on context: CanvasRenderingContext2D)
    func layoutSubviews()
    var subviews: [DRView] { get set }
}

extension DRView {
    func draw(on context: CanvasRenderingContext2D) {
        // Default do nothing
    }
    
    func layoutSubviews() {
        // Default do nothing
    }
}


@main
struct Demo {
   static func main() {
       
        let style = document.createElement(localName: "style")
        style.jsObject.innerHTML = """
        body {
        margin: 0;
        overflow: hidden;
        background-color: #808080;
        }
        """
        document.head?.appendChild(node: style)
//        document.
        
       let canvas = Canvas(width: UInt32(globalThis.innerWidth), height: UInt32(globalThis.innerHeight))
        let context = canvas.context
        context.setFillStyle( JSColor.rgba(0, 255, 0, 1))
        context.fill(rect: CGRect( origin: CGPoint(x: 0, y: 0),
                                   size: CGSize(width: 50.0, height: 50.0) ) )
       
       var isResizing = false
       var resizeStartX: CGFloat = 0
       var resizeStartY: CGFloat = 0
       var initialWidth: CGFloat = 0
       var initialHeight: CGFloat = 0
       var rectWidth: CGFloat = 200
       var rectHeight: CGFloat = 200
       var rectX: CGFloat = 100
       var rectY: CGFloat = 100
       
       canvas.element.addEventListener(type: "mousedown") { event in
           guard let event = MouseEvent(from: event.jsValue) else {
               return
           }
           let rect = canvas.element.getBoundingClientRect()
           let mouseX: CGFloat = CGFloat(event.clientX) - CGFloat(rect.left)
           let mouseY: CGFloat = CGFloat(event.clientY) - CGFloat(rect.top)
           
           if (
               mouseX > rectX + rectWidth - 10 &&
               mouseY > rectY + rectHeight - 10 &&
               mouseX < rectX + rectWidth &&
               mouseY < rectY + rectHeight
               ) {
                   isResizing = true;
                   resizeStartX = mouseX;
                   resizeStartY = mouseY;
                   initialWidth = rectWidth;
                   initialHeight = rectHeight;
               }
       }
       
       canvas.element.addEventListener(type: "mousemove") { event in
           guard let event = MouseEvent(from: event.jsValue) else {
               return
           }
           
           if (isResizing) {
               var rect = canvas.element.getBoundingClientRect()
               
               var mouseX = CGFloat(event.clientX) - CGFloat( rect.left )
               var mouseY = CGFloat(event.clientY) - CGFloat(rect.top)
               
               rectWidth = initialWidth + (mouseX - resizeStartX)
               rectHeight = initialHeight + (mouseY - resizeStartY)
               
           }
                    
       }
       
       canvas.element.addEventListener(type: "mouseup") { event in
           guard let event = MouseEvent(from: event.jsValue) else {
               return
           }
           
           isResizing = false
       }
       
//       let
//       func draw() {
//           context.setFillStyle( JSColor.rgba(0, 255, 0, 1))
//           context.fill(rect: CGRect( origin: CGPoint(x: 0, y: 0),
//                                      size: CGSize(width: rectWidth, height: rectHeight) ) )
//           
////           let frameRequestCallback: FrameRequestCallback  = { _ in
//////               draw()
////           }
//           let _ = globalThis.requestAnimationFrame(callback: frameRequestCallback)
//           
//       }
       
       
//       let callback: FrameRequestCallback = { _ in
//            context.setFillStyle( JSColor.rgba(0, 255, 0, 1))
//           context.fill(rect: CGRect( origin: CGPoint(x: 0, y: 0),
//                                      size: CGSize(width: rectWidth, height: rectHeight) ) )
//           let _ = globalThis.requestAnimationFrame(callback: callback)
//       }
//       
//       FrameRe
//       func draw(_ time: DOMHighResTimeStamp) 
       
       
       
       
        
        _ = document.body?.appendChild(node: canvas.element)
       
       
    }
}
