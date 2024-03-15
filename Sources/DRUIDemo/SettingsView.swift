//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import DRUI

class SettingsView: DRView {
    private let viewModel: DeviceViewModel
    var userInteractEnabled: Bool = false
    
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    
    var backgroundColor: JSColor = .rgba(0, 255, 0, 0.1)
    
    var subviews: [DRView] = []
    
    var hidden: Bool = false
    
    init(viewModel: DeviceViewModel) {
        self.viewModel = viewModel
        self.userInteractEnabled = false
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
        self.backgroundColor = .rgba(0, 0, 0, 0)
        let views: [SettingCell] = [
            SettingCell(text: "playlist", backgroundColor: .blue) { [weak viewModel] in
                viewModel?.showPlayList.toggle()
            },
            SettingCell(text: "pr", backgroundColor: .green) { [weak viewModel] in
                viewModel?.showPr.toggle()
            },
            SettingCell(text: "svip", backgroundColor: .yellow) { [weak viewModel] in
                viewModel?.showSVIP.toggle()
            },
            SettingCell(text: "ad", backgroundColor: .red) { [weak viewModel] in
                viewModel?.showAd.toggle()
            },
        ]
        self.subviews = views
        self.hidden = false
        viewModel.$showPlayList
            .observe { show in
                views[0].text = "playlist: \(show ? "show" : "hidden")"
            }
        
        viewModel.$showPr
            .observe { show in
                views[1].text = "pr: \(show ? "show" : "hidden")"
            }
        
        viewModel.$showSVIP
            .observe { show in
                views[2].text = "svip: \(show ? "show" : "hidden")"
            }
        
        viewModel.$showAd
            .observe { show in
                views[3].text = "ad: \(show ? "show" : "hidden")"
            }
        
    }
    
    func layoutSubviews() {
        
        subviews.indices
            .forEach { index in
                subviews[index].size = CGSize(width: self.width, height: 50)
                subviews[index].left = 0
                subviews[index].top = 50 * CGFloat(index)
            }
    }
    
    
}

class SettingCell: DRView {
    var text: String
    var userInteractEnabled: Bool = false
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    var backgroundColor: JSColor = .rgba(0, 0, 0, 0)
    var subviews: [DRView] = []
    var button: Button
    
    var hidden: Bool = false
 
    init(text: String, backgroundColor: JSColor, onClick: @escaping () -> Void) {
        self.text = text
        self.button = Button(color: backgroundColor, onClick: onClick)
        subviews.append(self.button)
    }
    
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.setFillStyle(.rgba(0, 0, 0, 0.1))
        context.fill(rect: self.frame)
        context.restore()
        
        context.save()
        context.font = "50px Arial"
        context.fill(text, x: 0 + self.left, y: 40 + self.top )
        context.restore()
    }
    
    func layoutSubviews() {
        button.size = CGSize(width: 50, height: 50)
        button.right = self.width
        button.top = 0
    }
}
