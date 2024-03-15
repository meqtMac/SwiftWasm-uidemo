//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct A: HTMDSL {
    public let element: HTMLAnchorElement
    
    init() {
        element = HTMLAnchorElement(from: document.createElement(localName: "a"))!
    }
    
    // TODO: update with A content
    init(href: String, @TableCellBuilder content: () -> TableCellBuilder.Component) {
        self.init()
        element.href = href
        for element in content() {
            switch element {
            case let .text(text):
                self.element.appendChild(node: text)
            case let .elment(element):
                self.element.appendChild(node: element)
            }
        }
    }
}
