//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/29.
//

import Foundation
import DOM
import WebAPIBase

let document = globalThis.document

public protocol HTMDSL {
    associatedtype Element: HTMLElement
    var element: Element { get }
}

struct Button: HTMDSL {
    let element: HTMLButtonElement
    
    init(title: String) {
        self.element = HTMLButtonElement(from: document.createElement(localName: "button"))!
        element.innerText = title
    }
    
    init(title: String, onClick: @escaping () -> Void ) {
        self.element = HTMLButtonElement(from: document.createElement(localName: "button"))!
        element.innerText = title
        element.onclick = { _ in
            onClick()
            return .undefined
        }
    }
}

struct Div: HTMDSL {
    let element: HTMLDivElement
    
    init() {
        self.element = HTMLDivElement(from: document.createElement(localName: "div"))!
    }
    
    init(@HTMLBuilder content: () -> [any HTMDSL] ) {
        element = HTMLDivElement(from: document.createElement(localName: "div"))!
        for child in content() {
            element.appendChild(node: child.element)
        }
    }
}

struct Canvas: HTMDSL {
    internal let element: HTMLCanvasElement
    var context: CanvasRenderingContext2D {
        element.getContext(CanvasRenderingContext2D.self)!
    }
    
    init(width: UInt32, height: UInt32) {
        element = HTMLCanvasElement(from: document.createElement(localName: "canvas"))!
        element.width = width
        element.height = height
    }
}



extension HTMLElement {
    public  func removeChilds() {
        while let node = self.firstChild {
            self.removeChild(child: node)
        }
    }
}

//struct
