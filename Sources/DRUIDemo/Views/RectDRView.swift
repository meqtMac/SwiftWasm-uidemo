//
//  RectDRView.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//


import Foundation
import DOM
import DRUI
import JavaScriptKit

class RectDRView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    
    var frame: CGRect = .init(origin: .init(x: 0, y: 0), size: .init(width: 0, height: 0))
    
    var backgroundColor: JSColor = .black
    
    var subviews: [DRView] = []
}

class CapsuleDRView: CapsuleView {
    var userInteractEnabled: Bool = true
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    
    var backgroundColor: JSColor = .yellow
    
    var subviews: [DRView] = []
    
    var hidden: Bool = false
    
    func touchBegin(with point: CGPoint) {
        globalThis.alert(message: "\(JSDate())")
    }
    
    func touchMove(with point: CGPoint) {
        print("")
    }
    
    func touchEnd(with point: CGPoint) {
        globalThis.alert(message: "Volume Up")
    }
}

class DeviceLabelView: DRView {
    let viewModel: DeviceViewModel
 
    var userInteractEnabled: Bool = false
    
    var hidden: Bool = false
    
    var frame: CGRect
    
    var backgroundColor: DOM.JSColor
    
    var subviews: [DRView]
    
    init(viewModel: DeviceViewModel) {
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
        self.backgroundColor = .red
        self.subviews = []
        self.viewModel = viewModel
    }
    
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.font = "16px Arial"
        let device = viewModel.device
        context.fill(device.name, x: 0, y: 16)
        context.fill(device.statusBarHeight.description, x: 0, y: 32)
        context.fill("\(device.size)", x: 0, y: 48)
        context.fill(device.safeAreaBottom.description, x: 0, y: 64)
        context.fill(device.uiSizeClass.rawValue, x: 0, y: 80)
        
        context.restore()
    }
    
}
