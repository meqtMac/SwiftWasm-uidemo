import DOM
import JavaScriptKit
import WebAPIBase
import Foundation


let currentDevice: Device = .iPhone15Pro

@main
struct Demo {
   static func main() {
       // prepare
       let style = document.createElement(localName: "style")
       style.jsObject.innerHTML = """
            body {
                margin: 0;
                overflow: hidden;
                background-color: #808080;
            }
        """
       document.head?.appendChild(node: style)
       
       // setup drawing loop and event manager
       let view = DemoView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: currentDevice.size.width, height: currentDevice.size.height + 100)), backgroundColor: .rgba(0, 0, 0, 0))
       UIManager.start(view: view)
   }
}
