import DOM
import JavaScriptKit
import WebAPIBase
import Foundation

//class DRView {
//    var frame: CGRect
//    
//    func draw(on context: CanvasRenderingContext2D) {
//    }
//    
//    var subviews: [DRView]
//}

protocol DRView {
    var frame: CGRect { get set }
    var backgroundColor: JSColor { get set }
    func draw(on context: CanvasRenderingContext2D)
    var subviews: [DRView] { get set }
}

extension DRView {
    func draw(on context: CanvasRenderingContext2D) {
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
        
        _ = document.body?.appendChild(node: canvas.element)
    }
}
