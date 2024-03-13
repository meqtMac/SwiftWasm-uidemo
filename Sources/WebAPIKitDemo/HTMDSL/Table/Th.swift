//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import DOM

public struct Th: HTMDSL {
    public let element: HTMLTableCellElement
    init() {
        element = .init(from: document.createElement(localName: "th"))!
    }
    public enum Scope: String {
        case row = "row"
        case col = "col"
        case rowgroup = "rowgroup"
        case colgroup = "colgroup"
    }
    
    init(scope: Scope? = nil, colspan: UInt32? = nil, rowSpan: UInt32? = nil, @TableCellBuilder content: () -> TableCellBuilder.Component) {
        self.init()
        if let scope {
            element.scope = scope.rawValue
        }
        if let colspan {
            element.colSpan = colspan
        }
        if let rowSpan {
            element.rowSpan = rowSpan
        }
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
