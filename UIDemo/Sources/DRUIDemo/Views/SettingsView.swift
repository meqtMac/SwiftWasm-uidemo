//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DRFrame
import OpenCombineShim
import DRUI

struct SettingsView: DRView {
    
    private var cancellables = Set<AnyCancellable>()
    var userInteractEnabled: Bool = false
    
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    
    var backgroundColor: Color32 = .init(r: 0, g: 255, b: 0, a: 26)
    
    var subviews: [DRViewRef] {
        get { views.map { $0 } }
        set {
            fatalError("over write addSubView")
        }
    }
    
    var views: [Arc<SettingCell>] = []
    
    var hidden: Bool = false
    
    init() {
        self.userInteractEnabled = false
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
        self.backgroundColor = .transparent
        views = [
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
        ].map {
            Arc(wrappedValue: $0)
        }
        
        var views = self.views
        self.hidden = false
        viewModel.$showPlayList
            .sink { show in
                views[0].wrappedValue.text = "playlist: \(show ? "show" : "hidden")"
                console.log(data: "toggle playlist")
            }
            .store(in: &cancellables)
        
        viewModel.$showPr
            .sink { show in
                views[1].wrappedValue.text = "pr: \(show ? "show" : "hidden")"
            }
            .store(in: &cancellables)
        
        viewModel.$showSVIP
            .sink { show in
                views[2].wrappedValue.text = "svip: \(show ? "show" : "hidden")"
            }
            .store(in: &cancellables)
        
        viewModel.$showAd
            .sink { show in
                views[3].wrappedValue.text = "ad: \(show ? "show" : "hidden")"
            }
            .store(in: &cancellables)
        
    }
    
    mutating func layoutSubviews() {
        subviews.indices
            .forEach { index in
                views[index].wrappedValue.size = CGSize(width: self.width, height: 50)
                views[index].wrappedValue.left = 0
                views[index].wrappedValue.top = 50 * CGFloat(index)
            }
    }
    
    
}

struct SettingCell: DRView {
    var text: String
    var userInteractEnabled: Bool = false
    var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    var backgroundColor: Color32 = .transparent
    var subviews: [DRViewRef] = []
    @Arc
    var button: Button
    
    var hidden: Bool = false
 
    init(text: String, backgroundColor: Color32, onClick: @escaping () -> Void) {
        self.text = text
        self.button = Button(color: backgroundColor, onClick: onClick)
        subviews.append($button)
    }
    
    func draw(on context: Context2D) {
        context.save()
//        context.setFillStyle(.rgba(0, 0, 0, 0.1))
//        context.fill(rect: self.frame)
        context.restore()
        
        context.save()
        context.font = "50px Arial"
//        context.fill(text, x: 0 + self.left, y: 40 + self.top )
        context.restore()
    }
    
    mutating func layoutSubviews() {
        button.size = CGSize(width: 50, height: 50)
        button.right = self.width
        button.top = 0
    }
}
