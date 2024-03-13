//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/19.
//

import DOM

/**
 `<sup>: The Superscript element
 
 The   ``Sup`` ``HTMDSL`` element specifies inline text which is to be displayed as superscript for solely typographical reasons. Superscripts are usually rendered with a raised baseline using smaller text.

 ### Example Usage:
 ```swift
 Th(scope: .col) { "Mass (10"; Sup("24"); "kg)" }
 ```
 
 ### Attributes:
 This element only includes the [global attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes).
 
 ###  Categories:
 - Flow content.
 - Phrasing content.
 - Palpable content.
 ###  Contexts in which this element can be used:
 Where phrasing content is expected.
 ### Content model:
 Phrasing content.
 
 ### Specifications:
 [HTMLStandard]("https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-sub-and-sup-elements")
 */
public struct Sup: HTMDSL {
    public let element: HTMLElement
    init() {
        element = HTMLElement(from: document.createElement(localName: "sup"))!
    }
    
    // TODO: Permitted Content
    init(_ content: String) {
        self.init()
        self.element.appendChild(node: Text(data: content))
    }
}
