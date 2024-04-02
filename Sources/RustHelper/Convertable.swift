//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/2.
//

import Foundation

public protocol From<T> {
    associatedtype T
    init(_ value: T)
}

public protocol Into<T> {
    associatedtype T
    func into() -> T
}
