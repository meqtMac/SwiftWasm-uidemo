import Foundation
import DRUI


@main
struct DemoApp: SwiftWasmApp {
    var view: DRView {
        DemoView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 0, height: 0)),
                 backgroundColor: .rgba(255, 0, 0, 255))
    }
}

