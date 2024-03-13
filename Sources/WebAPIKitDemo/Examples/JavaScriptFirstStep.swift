//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/20.
//

import Foundation
import DOM

struct FirstStep: HTMDSL {
    let element: HTMLButtonElement
    
    init(title: String, parent: HTMLElement ) {
        element = Button(title: title) {
            let div = Div {
                H1 { "Number guessing game" }
                P { "We have selected a random number between 1 and 100. See if you can guess it in 10 turns or fewer. We'll tell you if your guess was too high or too low." }
                Div {
                    Input(type: "number", content: "xxx") { InputEvent in
                        return
                    }
                    Input(type: "submit", content: "xxx") { inputEvent in
                        return
                    }
                }
            }
//            parent.removeChilds()
//            let table = Table {
//                Caption {
//                    "Data about the planets of our solar system (Planetary facts taken from"
//                    A (href: "https://nssdc.gsfc.nasa.gov/planetary/factsheet/") {
//                        "Nasa's Planetary Fact Sheet - Metric"
//                    }
//                    ")"
//                }
//                ColGroup {
//                    Col(span: 2)
//                    Col(style: "border: 2px solid black")
//                    Col(span: 9)
//                }
//                Self.headers
//                Self.data
//            }
//            parent.appendChild(node: table.element)
        }.element
    }

}

