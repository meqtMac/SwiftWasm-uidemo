//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct TBody: HTMDSL {
    public let element: HTMLTableSectionElement
    
    init() {
        element = HTMLTableSectionElement(from: document.createElement(localName: "tbody"))!
    }
    
    init(@TableBodyBuilder content: () -> [Tr]) {
        self.init()
        for html in content() {
            element.appendChild(node: html.element)
        }
    }
}

