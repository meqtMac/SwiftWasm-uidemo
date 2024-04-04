//
//  DemoView.swift
//
//
//  Created by 蒋艺 on 2024/3/14.
//

import Foundation
//import DOM
//import WebAPIBase
//import JavaScriptKit
import DRFrame
import DRUI
import OpenCombineShim
//import RefCount


struct DemoView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: Color32
    var subviews: [DRViewRef] = []
    private var cancellables = Set<AnyCancellable>()
    
    @Arc
    var deviceView: DeviceView
    @Arc
    var label: DeviceLabelView
    
    var buttons: [Arc<Button>] = []
    
    @Arc
    var settingView: SettingsView
    
    
    init(frame: CGRect, backgroundColor: Color32) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        viewModel
            .objectWillChange
            .sink { _ in
                var manager = UIManager.main
                manager.invalidate()
            }
            .store(in: &cancellables)
        
        let deviceView = DeviceView(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: viewModel.device.size), backgroundColor: .black)
        self.deviceView = deviceView
        
        let label = DeviceLabelView(viewModel: viewModel)
        self.label = label
        
        self.subviews = []
        self.settingView = SettingsView()
        self.settingView.backgroundColor = .red
        
        buttons = [
            Button(color: .red)  {
                viewModel.device = .iPhone8plus
            },
            Button(color: .green)  {
                viewModel.device = .iPhone13mini
            },
            Button(color: .red)  {
                viewModel.device = .iPhone15
            },
            Button(color: .green)  {
                viewModel.device = .iPhone15Pro
            },
            Button(color: .red)  {
                viewModel.device = .iPhone15ProMax
            },
            Button(color: .green)  {
                viewModel.device = .iPadMini6
            },
            Button(color: .red)  {
                viewModel.device = .iPadMini6_Horizontal
            },
            Button(color: .green)  {
                viewModel.device = .iPadPro11inch
            },
            Button(color: .blue)  {
                viewModel.device = .iPadPro11inch_Horizontal
            },
        ].map { Arc(wrappedValue: $0) }
        
        self.subviews = []
        self.subviews = [self.$deviceView, self.$label, self.$settingView] + buttons.map { $0 }
    }
    
    mutating func layoutSubviews() {
        deviceView.size = viewModel.device.size
        deviceView.left = 0
        deviceView.top = 100
        label.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.width, height: 100))
        
        (0..<buttons.count)
            .forEach { index in
                buttons[index].wrappedValue.size = CGSize(width: 50, height: 50)
                buttons[index].wrappedValue.left = 50 * CGFloat(index)
                buttons[index].wrappedValue.top = deviceView.bottom + 50
            }
        
        settingView.size = CGSize(width: 400, height: 50 * 4)
        settingView.left = deviceView.right + 50
        settingView.top = deviceView.top
    }
    
}
