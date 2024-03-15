//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM
import JavaScriptKit

struct Table: HTMDSL {
    let element: HTMLTableElement
    
    init() {
        self.element = HTMLTableElement(from: document.createElement(localName: "table"))!
    }
    
    // TODO: update with Table Element
    init(@HTMLBuilder content: () -> [any HTMDSL] ) {
        element = HTMLTableElement(from: document.createElement(localName: "table"))!
        for child in content() {
            element.appendChild(node: child.element)
        }
    }
}








