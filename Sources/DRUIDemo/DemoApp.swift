import Foundation
import DRUI


let currentDevice: Device = .iPhone15Pro

@main
struct DemoApp: SwiftWasmApp {
    var view: DRView {
        DemoView(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 0, height: 0)),
                 backgroundColor: .rgba(0, 0, 0, 0))
    }
}

