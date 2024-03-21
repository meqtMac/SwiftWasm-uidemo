//
//  DemoView.swift
//
//
//  Created by 蒋艺 on 2024/3/14.
//

import Foundation
import DOM
import WebAPIBase
import JavaScriptKit
import DRUI
import OpenCombineShim



class DemoView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: JSColor
    var subviews: [DRView]
    private var cancellables = Set<AnyCancellable>()
    
    let viewModel = DeviceViewModel()
    
    var deviceView: DeviceView
    var label: DeviceLabelView
    var buttons: [Button] = []
    var settingView: SettingsView
    
    init(frame: CGRect, backgroundColor: JSColor) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        viewModel
            .objectWillChange
            .sink { _ in
                UIManager.main.invalidate()
            }
            .store(in: &cancellables)
        
        let deviceView = DeviceView(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: viewModel.device.size), backgroundColor: .black, viewModel: viewModel)
        self.deviceView = deviceView
        
        let label = DeviceLabelView(viewModel: viewModel)
        self.label = label
        
        self.subviews = []
        self.settingView = SettingsView(viewModel: viewModel)
        self.settingView.backgroundColor = .red
        
        let buttons = [
            Button(color: .red)  { [weak self] in
                self?.viewModel.device = .iPhone8plus
            },
            Button(color: .green)  { [weak self] in
                self?.viewModel.device = .iPhone13mini
            },
            Button(color: .red)  { [weak self] in
                self?.viewModel.device = .iPhone15
            },
            Button(color: .green)  { [weak self] in
                self?.viewModel.device = .iPhone15Pro
            },
            Button(color: .red)  { [weak self] in
                self?.viewModel.device = .iPhone15ProMax
            },
            Button(color: .green)  { [weak self] in
                self?.viewModel.device = .iPadMini6
            },
            Button(color: .red)  { [weak self] in
                self?.viewModel.device = .iPadMini6_Horizontal
            },
            Button(color: .green)  { [weak self] in
                self?.viewModel.device = .iPadPro11inch
            },
            Button(color: .blue)  { [weak self] in
                self?.viewModel.device = .iPadPro11inch_Horizontal
            },
        ]
        
        self.subviews = [self.deviceView, label, self.settingView] + buttons
        self.buttons = buttons
    }
    
    func layoutSubviews() {
        deviceView.size = viewModel.device.size
        deviceView.left = 0
        deviceView.top = 100
        label.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.width, height: 100))
        
        (0..<buttons.count)
            .forEach { index in
                buttons[index].size = CGSize(width: 50, height: 50)
                buttons[index].left = 50 * CGFloat(index)
                buttons[index].top = deviceView.bottom + 50
            }
        
        settingView.size = CGSize(width: 400, height: 50 * 4)
        settingView.left = deviceView.right + 50
        settingView.top = deviceView.top
    }
    
}
