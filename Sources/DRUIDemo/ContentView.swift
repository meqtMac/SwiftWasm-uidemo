//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import WebAPIBase
import JavaScriptKit
import DRUI

class ContentView: RectView {
    private let viewModel: DeviceViewModel
    var userInteractEnabled: Bool = false
    
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    
    var backgroundColor: DOM.JSColor = .rgba(0, 255, 0, 0.1)
    
    var subviews: [DRView] = []
    
    var hidden: Bool = false
    
    var topContainer: RectView
    var centerContainer: RectView
    var bottomView: CapsuleView
    
    init(viewModel: DeviceViewModel) {
        self.viewModel = viewModel
        
        self.topContainer = {
            let view = RectDRView()
            view.backgroundColor = .rgba(255, 255, 255, 0.4)
            return view
        }()
        
        self.centerContainer = {
            let view = RectDRView()
            view.backgroundColor = .rgba(255, 255, 255, 0.4)
            return view
        }()
        
        self.bottomView = {
            let view = CapsuleDRView()
             view.backgroundColor = .rgba(255, 255, 255, 0.4)
            return view
        }()
        
        self.subviews = [topContainer, centerContainer, bottomView ]
    }
    
    func layoutSubviews() {
        let topHeight: CGFloat = 80
        let centerHeight: CGFloat = 101
        
        let adaptiveWidth: CGFloat
        let padding: CGFloat
        switch viewModel.device.uiSizeClass {
        case .regular:
            padding = 16
        case .large:
            padding = 30
        case .huge, .max:
            padding = self.width * 0.2
        }
        adaptiveWidth = self.width - 2 * padding
        
        topContainer.size = CGSize(width: adaptiveWidth, height: topHeight)
        centerContainer.size = CGSize(width: adaptiveWidth, height: centerHeight)
        bottomView.size = CGSize(width: 182, height: 48)
        
        topContainer.centerX = width / 2
        centerContainer.centerX = width / 2
        bottomView.centerX = width / 2
        
        centerContainer.centerY = height / 2 + 10
        topContainer.bottom = centerContainer.top - height * 0.15
        bottomView.top = centerContainer.bottom + height * 0.15
        
        
        let topGap = topContainer.top
        if topGap < 16 {
            topContainer.top = 16
        }
        
        let bottomGap = height - bottomView.bottom
        if bottomGap < 16 {
            bottomView.bottom = height - 16
        }
        
    }
    
}
