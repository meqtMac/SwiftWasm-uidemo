//
//  SwiftWasmApp.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM

public protocol SwiftWasmApp {
    var view: DRView { get }
    init()
}

public extension SwiftWasmApp {
    static func main() {
        // prepare
        let style = globalThis.document.createElement(localName: "style")
        style.jsObject.innerHTML = """
             body {
                 margin: 0;
                 overflow: hidden;
                 background-color: #808080;
             }
         """
        globalThis.document.head?.appendChild(node: style)
        
        let app: SwiftWasmApp = Self.init()
        
        UIManager.start(view: app.view)
    }
}
