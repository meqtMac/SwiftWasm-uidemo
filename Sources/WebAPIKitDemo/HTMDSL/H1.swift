//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/20.
//

import DOM

/// Flow content, heading content, palpable content.
public struct H1: HTMDSL {
    public let element: HTMLHeadingElement
    
    init() {
        element = HTMLHeadingElement(from: document.createElement(localName: "h1"))!
    }
    
    // TODO: update with Phrasing content
    init(_ content: () -> String) {
        self.init()
        self.element.appendChild(node: Text(data: content()))
    }
}
