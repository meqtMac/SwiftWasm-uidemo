//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct TFoot: HTMDSL {
    public let element: HTMLTableSectionElement
    
    init() {
        element = HTMLTableSectionElement(from: document.createElement(localName: "tfoot"))!
    }
    
    init(@TableBodyBuilder content: () -> [Tr]) {
        self.init()
        for tr in content() {
            element.appendChild(node: tr.element)
        }
    }
}
