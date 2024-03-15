//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

struct Caption: HTMDSL {
    let element: HTMLTableCaptionElement
    
    private init() {
        element = HTMLTableCaptionElement(from: document.createElement(localName: "caption"))!
    }
//    init(_ caption: String) {
//        self.init()
//        element.innerText = caption
//    }
    
    // TODO: update with caption element
    init(@TableCellBuilder context: () -> TableCellBuilder.Component) {
        self.init()
        for html in context() {
//            element.appendChild(node: html.element)
            switch html {
            case let .text(text):
                self.element.appendChild(node: text)
            case let .elment(element):
                self.element.appendChild(node: element)
            }
        }
    }
}

