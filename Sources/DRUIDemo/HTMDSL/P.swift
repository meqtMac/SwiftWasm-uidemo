//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/20.
//

import DOM

public struct P: HTMDSL {
    public let element: HTMLParagraphElement
    
    init() {
//        element = HTMLAnchorElement(from: document.createElement(localName: ""))!
        element = HTMLParagraphElement(from: document.createElement(localName: "p"))!
    }
    
    // TODO: update with Phrasing content
    init(_ content: () -> String) {
        self.init()
//        element.href = href
//        for element in content() {
//            switch element {
//            case let .text(text):
//                self.element.appendChild(node: text)
//            case let .elment(element):
//                self.element.appendChild(node: element)
//            }
//        }
        self.element.appendChild(node: Text(data: content()))
    }
}
