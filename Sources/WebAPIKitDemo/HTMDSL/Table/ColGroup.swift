//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct ColGroup: HTMDSL {
    public let element: HTMLTableColElement
    init() {
        element = HTMLTableColElement(from: document.createElement(localName: "colgroup"))!
    }
    
    init(@TableColGroupBuilder cols: () -> TableColGroupBuilder.Component) {
        self.init()
        for col in cols() {
            element.appendChild(node: col.element)
        }
    }
}

public struct Col: HTMDSL {
    public let element: HTMLTableColElement
    init() {
         element = HTMLTableColElement(from: document.createElement(localName: "col"))!
    }
    
    init(style: String? = nil, span: UInt32? = nil) {
        self.init()
        if let style {
            element.setAttribute(qualifiedName: "style", value: style)
        }
        if let span {
            element.span = span
        }
    }
}
