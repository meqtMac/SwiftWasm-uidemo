//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation

//extension ImageData {
//    convenience init(data: [UInt8], sw: UInt32) {
//        self.init(data: .init(slowly: data), sw: sw)
//    }
//}
//
//extension JSUInt8ClampedArray {
//    convenience init(slowly array: [UInt8]) {
//        self.init(length: array.count)
//        for i in 0..<array.count {
//            self[i] = array[i]
//        }
//    }
//}
//
//extension Array where Element == UInt8 {
//    init(with jsArray: JSUInt8ClampedArray ) {
//        self.init(unsafeUninitializedCapacity: jsArray.lengthInBytes) { buffer, initializedCount in
//            initializedCount = jsArray.lengthInBytes
//            _ = jsArray.withUnsafeBytes { ptr in
//               buffer.moveInitialize(fromContentsOf: UnsafeMutableBufferPointer(mutating: ptr))
//            }
//        }
//   }
//}
