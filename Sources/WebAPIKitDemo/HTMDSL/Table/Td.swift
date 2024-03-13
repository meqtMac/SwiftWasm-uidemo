//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct Td: HTMDSL {
    public let element: HTMLTableCellElement
    init() {
        element = HTMLTableCellElement(from: document.createElement(localName: "td"))!
    }
    
//    init(colspan)
    init( colspan: UInt32? = nil, rowSpan: UInt32? = nil ) {
         self.init()
        if let colspan {
            element.colSpan = colspan
        }
        if let rowSpan {
            element.rowSpan = rowSpan
        }
    }
    init(colspan: UInt32? = nil, rowSpan: UInt32? = nil, @TableCellBuilder content: () -> TableCellBuilder.Component ) {
        self.init(colspan: colspan, rowSpan: rowSpan)
        for element in content() {
            switch element {
            case let .text(text):
                self.element.appendChild(node: text)
            case let .elment(element):
                self.element.appendChild(node: element)
            }
        }
    }
}
