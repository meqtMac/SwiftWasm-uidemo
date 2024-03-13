//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

struct Thead: HTMDSL {
    let element: HTMLTableSectionElement
    
    init() {
        element = HTMLTableSectionElement(from: document.createElement(localName: "thead"))!
    }
    
    init(@TableBodyBuilder content: () -> [Tr]) {
        self.init()
        for html in content() {
            element.appendChild(node: html.element)
        }
    }
}





