//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct Tr: HTMDSL {
    public let element: HTMLTableRowElement
    init() {
        element = HTMLTableRowElement(from: document.createElement(localName: "tr"))!
    }
    
    init(@TableRowBuilder content: () -> TableRowBuilder.Component) {
        self.init()
        for child in content() {
            element.appendChild(node: child.element)
        }
    }
}
