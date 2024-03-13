//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public typealias EventHandlerNonNull = (Event) -> JSValue
public typealias EventHandler = EventHandlerNonNull?
