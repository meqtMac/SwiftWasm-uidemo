//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/2.
//

import Foundation

public protocol From {
    associatedtype T
    init(_ value: T)
}

public protocol Into {
    associatedtype T
    static func into() -> T
}
