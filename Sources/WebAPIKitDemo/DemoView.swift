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

class RectDRView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    
    var frame: CGRect = .init(origin: .init(x: 0, y: 0), size: .init(width: 0, height: 0))
    
    var backgroundColor: JSColor = .black
    
    var subviews: [DRView] = []
}

class CapsuleDRView: CapsuleView {
    var userInteractEnabled: Bool = true
    var frame: CGRect = .zero
    
    var backgroundColor: JSColor = .yellow
    
    var subviews: [DRView] = []
    
    var hidden: Bool = false
    
    func touchBegin(with point: CGPoint) {
//        globalThis.alert(message: "Volume Up")
    }
    
    func touchMove(with point: CGPoint) {
        print("")
    }
    
    func touchEnd(with point: CGPoint) {
        globalThis.alert(message: "Volume Up")
    }
    
    
}

class DeviceLabelView: DRView {
    var userInteractEnabled: Bool = false
    
    var hidden: Bool = false
    
    var frame: CGRect
    
    var backgroundColor: DOM.JSColor
    
    var subviews: [DRView]
    
    init() {
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100))
        self.backgroundColor = .red
        self.subviews = []
    }
    
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.font = "16px Arial"
        context.fill(currentDevice.name, x: 0, y: 16)
        context.fill(currentDevice.statusBarHeight.description, x: 0, y: 32)
        context.fill("\(currentDevice.size)", x: 0, y: 48)
        context.fill(currentDevice.safeAreaBottom.description, x: 0, y: 64)
        context.fill(currentDevice.uiSizeClass.rawValue, x: 0, y: 80)
        
        context.restore()
    }
    
}

class ContentView: RectView {
    var userInteractEnabled: Bool = false
    
    var frame: CGRect = .zero
    
    var backgroundColor: DOM.JSColor = .rgba(0, 255, 0, 0.1)
    
    var subviews: [DRView] = []
    
    var hidden: Bool = false
    
    var topContainer: RectView
    var centerContainer: RectView
    var bottomView: CapsuleView
    
    init() {
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
        switch currentDevice.uiSizeClass {
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

class DeviceView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: JSColor
    var subviews: [DRView]
    
    var titleView: RectView
    var playList: RectView
    var svipView: RectView
    var adView: RectView
    var contentView: ContentView
    
    init(frame: CGRect, backgroundColor: JSColor) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        
        self.titleView = {
            let rect = RectDRView()
            rect.backgroundColor = .yellow
            return rect
        }()
        
        self.playList = {
            let rect = RectDRView()
            rect.backgroundColor = .green
            return rect
        }()
        
        self.adView = {
             let rect = RectDRView()
            rect.backgroundColor = .red
            return rect
        }()
        
        self.svipView = {
            let view = RectDRView()
            view.backgroundColor = .yellow
            return view
        }()
        
        self.contentView = {
            let view = ContentView()
            view.backgroundColor = .rgba(0, 255, 0, 0.3)
            return view
        }()
        
//        self.svipView.hidden = true
//        self.adView.hidden = true
        
        self.subviews = [
                         self.titleView,
                         self.playList,
                         self.svipView,
                         self.adView,
                         self.contentView
        ]
    }
    
    func layoutSubviews() {
        let titleHeight: CGFloat = 86
        let playListHeight: CGFloat = 67 + ( (currentDevice.safeAreaBottom) > 0 ? 7 : 0 )
        
        self.titleView.frame = CGRect(origin: CGPoint(x: 0, y: currentDevice.statusBarHeight), size: CGSize(width: self.width, height: titleHeight))
        
        self.playList.frame = CGRect(origin: CGPoint(x: 0, y: self.height - playListHeight), size: CGSize(width: self.width, height: playListHeight))
        
        self.adView.size = adSize()
        self.adView.bottom = self.playList.top
        self.adView.centerX = self.width / 2
        
        self.svipView.size = svipSize()
        self.svipView.bottom = self.adView.top - 16
        self.svipView.centerX = self.width / 2
        let contentHeight: CGFloat
        if (!self.svipView.hidden) {
            contentHeight = svipView.top - titleView.bottom
        } else if (!self.adView.hidden ) {
            contentHeight = adView.top - titleView.bottom
        } else {
            contentHeight =  height - titleView.bottom - playListHeight
        }
        
        self.contentView.size = CGSize(width: width, height: max(contentHeight, 300))
        self.contentView.top = titleView.bottom
        self.contentView.centerX = self.width / 2
        
        self.svipView.top = self.contentView.bottom
    }
    
    private func adSize() -> CGSize {
        let aspectRatio = 9.0 / 16.0
        
        let width: CGFloat = {
            let isSmallScreenPhone = currentDevice.size.height < 812
            if (currentDevice.isiPad) {
                let deviceWidth = currentDevice.size.width
                if deviceWidth == 1130 || deviceWidth == 1024 {
                    return 375
                }
                if deviceWidth < 527 {
                    return deviceWidth
                }
                if (deviceWidth - 576) / 2 > 100 {
                    return 576
                }
                return 527
            } else if isSmallScreenPhone && currentDevice.size.height <= 667 {
                return 280
            }
            return currentDevice.size.width
        }()
        
        return CGSize(width: width, height: width * aspectRatio)
    }
    
    private func svipSize() -> CGSize {
        // 69 or 48
        let height: CGFloat = 48
        let padding: CGFloat
        switch currentDevice.uiSizeClass {
        case .regular:
            padding = 16
        case .large:
            padding = 30
        case .huge, .max:
            padding = currentDevice.size.width * 0.2
        }
        
        let width = currentDevice.size.width - 2 * padding
        return CGSize(width: width, height: height)
    }
}

class DemoView: RectView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: JSColor
    var subviews: [DRView]
    
    var deviceView: DeviceView
    var label: DeviceLabelView
    
    init(frame: CGRect, backgroundColor: JSColor) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        
       let deviceView = DeviceView(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: currentDevice.size), backgroundColor: .black)
        self.deviceView = deviceView
        
        let label = DeviceLabelView()
        self.label = label
        
        self.subviews = [self.deviceView, label]
    }
    
    func layoutSubviews() {
        deviceView.frame = CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: self.width, height: self.height - 100))
        label.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.width, height: 100))
    }
    
}
