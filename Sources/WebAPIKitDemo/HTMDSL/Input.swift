//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/20.
//

import DOM

/// Flow content, heading content, palpable content.
struct Input: HTMDSL {
    let element: HTMLInputElement
    
    init() {
        element = HTMLInputElement(from: document.createElement(localName: "input"))!
    }
    
    init(type: String, content: String, onInput: @escaping (InputEvent) -> Void ) {
        self.init()
        element.type = type
//        element.type =
//        element.oninput = { event in
//
//        }
        element.oninput = { event in
            guard let inputEvent = InputEvent(from: event.jsObject) else {
                return .undefined
            }
            onInput(inputEvent)
            return .undefined
        }
    }
    
//    init() {
//        element = HTMLHeadingElement(from: document.createElement(localName: "h1"))!
//    }
//    
//    // TODO: update with Phrasing content
//    init(_ content: () -> String) {
//        self.init()
//        self.element.appendChild(node: Text(data: content()))
//    }
}
