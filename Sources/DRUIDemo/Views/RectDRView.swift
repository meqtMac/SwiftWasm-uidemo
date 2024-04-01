//
//  RectDRView.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//


import Foundation
import DRUI

struct RectDRView: RectView {
    
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    
    var frame: CGRect = .init(origin: .init(x: 0, y: 0), size: .init(width: 0, height: 0))
    
    var backgroundColor: Color32 = .black
    
    var subviews: [DRViewRef] = []
}

struct CapsuleDRView: CapsuleView {
    var userInteractEnabled: Bool = true
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    
    var backgroundColor: Color32 = .yellow
    
    var subviews: [DRViewRef] = []
    
    var hidden: Bool = false
    
    func touchBegin(with point: CGPoint) {
    }
    
    func touchMove(with point: CGPoint) {
    }
    
    func touchEnd(with point: CGPoint) {
    }
}

struct DeviceLabelView: DRView {
    let viewModel: DeviceViewModel
 
    var userInteractEnabled: Bool = false
    
    var hidden: Bool = false
    
    var frame: CGRect
    
    var backgroundColor: Color32
    
    var subviews: [DRViewRef]
    
    init(viewModel: DeviceViewModel) {
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
        self.backgroundColor = .red
        self.subviews = []
        self.viewModel = viewModel
    }
    
    func draw(on context: Context2D) {
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
