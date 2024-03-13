//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/20.
//

import DOM
import Foundation

struct FirstDemo: HTMDSL {
    let element: HTMLButtonElement
    
    init(title: String, parent: HTMLElement ) {
        element = Button(title: title) {
            parent.removeChilds()
            
            let canvas = Canvas(width: 800, height: 600)
            let context = canvas.context
            parent.appendChild(node: canvas.element)
            context.clear(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600)))
            context.beginPath()
            context.moveTo(x: 75, y: 50)
            context.lineTo(x: 100, y: 75)
            context.lineTo(x: 100, y: 25)
            context.fill()
            context.closePath()
            
        }.element
    }
}
