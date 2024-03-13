//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/5.
//

import WebSockets
import JavaScriptKit
import WebAPIBase
import DOM
import Foundation

struct WebSocketDemo: HTMDSL {
    let element: HTMLButtonElement
    init(title: String, parent: HTMLElement ) {
        let element = Button(title: title) {
            parent.jsObject.innerHTML = ""
            parent.removeChilds()
            let socket = WebSocket(url: "ws://localhost:8080/echo")
            guard let inputLine = HTMLInputElement(from: document.createElement(localName: "input")) else {
                console.error(data: "can't create input".jsValue)
                return
            }
            inputLine.type = "text"
            inputLine.placeholder = "Enter Shell command"
            let sendButton = Button(title: "Send") {
                let message = inputLine.value
                socket.send(data: message)
                inputLine.value = ""
            }
            guard let resultTextArea = HTMLTextAreaElement(from: document.createElement(localName: "textarea")) else {
                console.error(data: "can't create textArea")
                return
            }
            resultTextArea.rows = 5
            resultTextArea.cols = 40
            resultTextArea.readOnly = true

            let div = Div()
            _ = div.element.jsValue.appendChild(resultTextArea.jsValue)

            _ = parent.jsValue.appendChild(inputLine.jsValue)
            _ = parent.jsValue.appendChild(sendButton.element.jsValue)
            _ = parent.jsValue.appendChild(div.element.jsValue)

            socket.onOpen { _ in
                socket.send(data: "Hello Server from Carton WebAPI Demo")
                console.info(data: "\(socket.readyState)".jsValue)
            }
            
            socket.onMessage { event in
                resultTextArea.value = event.data.fromJSValue()!
            }
            
            socket.onClose { event in
                console.log(data: "closed".jsValue)
            }
            
            socket.onError { event in
                console.error(data: event.jsValue)
            }
        }.element
        
        self.element = element
    }

}
