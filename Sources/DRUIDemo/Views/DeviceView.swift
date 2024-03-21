//
//  DeviceView.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import DRUI

import OpenCombineShim

public typealias ObservableObject = OpenCombineShim.ObservableObject
public typealias Published = OpenCombineShim.Published

class DeviceViewModel: ObservableObject {
    
    @Published
    var device: Device = .iPhone15ProMax
    
    @Published
    var showPlayList: Bool = true
    
    @Published
    var showAd: Bool = true
    
    @Published
    var showPr: Bool = false
    
    @Published
    var showSVIP: Bool = true
}

class DeviceView: RectView {
    let viewModel: DeviceViewModel
    
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
    
    init(frame: CGRect, backgroundColor: JSColor, viewModel: DeviceViewModel) {
        self.viewModel = viewModel
        
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
            let view = ContentView(viewModel: viewModel)
            view.backgroundColor = .rgba(0, 255, 0, 0.3)
            return view
        }()
        
       self.subviews = [
                         self.titleView,
                         self.playList,
                         self.svipView,
                         self.adView,
                         self.contentView
        ]
        
        self.viewModel
            .$showPlayList
            .sink { [weak self] show in
                self?.playList.hidden = !show
            }
        //     .observe { [weak self] show in
        //     self?.playList.hidden = !show
        // }
        
        self.viewModel
            .$showAd
            .observe { [weak self] show in
                self?.adView.hidden = !show
            }
        
        self.viewModel
            .$showSVIP
            .observe { [weak self] show in
                self?.svipView.hidden = !show
            }
        
        
    }
    
    func layoutSubviews() {
        let titleHeight: CGFloat = 86
        let playListHeight: CGFloat = 67 + ( (viewModel.device.safeAreaBottom) > 0 ? 7 : 0 )
        
        self.titleView.frame = CGRect(origin: CGPoint(x: 0, y: viewModel.device.statusBarHeight), size: CGSize(width: self.width, height: titleHeight))
        
        self.playList.frame = CGRect(origin: CGPoint(x: 0, y: self.height - playListHeight), size: CGSize(width: self.width, height: playListHeight))
        
        self.adView.size = adSize()
        self.adView.bottom = self.playList.hidden ? height : self.playList.top
        self.adView.centerX = self.width / 2
        
        self.svipView.size = svipSize()
        self.svipView.bottom = viewModel.showAd ? self.adView.top - 16 : self.adView.bottom
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
            let isSmallScreenPhone = viewModel.device.size.height < 812
            if (viewModel.device.isiPad) {
                let deviceWidth = viewModel.device.size.width
                if deviceWidth == 1133 || deviceWidth == 1024 {
                    return 375
                }
                if deviceWidth < 527 {
                    return deviceWidth
                }
                if (deviceWidth - 576) / 2 > 100 {
                    return 576
                }
                return 527
            } else if isSmallScreenPhone && viewModel.device.size.height <= 667 {
                return 280
            }
            return viewModel.device.size.width
        }()
        
        return CGSize(width: width, height: width * aspectRatio)
    }
    
    private func svipSize() -> CGSize {
        // 69 or 48
        let height: CGFloat = 69
        let padding: CGFloat
        switch viewModel.device.uiSizeClass {
        case .regular:
            padding = 16
        case .large:
            padding = 30
        case .huge, .max:
            padding = viewModel.device.size.width * 0.2
        }
        
        let width = viewModel.device.size.width - 2 * padding
        return CGSize(width: width, height: height)
    }
}

