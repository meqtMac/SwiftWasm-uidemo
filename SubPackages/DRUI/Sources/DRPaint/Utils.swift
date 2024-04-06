//
//  Utils.swift
//
//
//  Created by 蒋艺 on 2024/4/6.
//

//extension Sequence {
//    func windowed(size: Int) -> [[Element]] {
//        var result: [[Element]] = []
//        var window: [Element] = []
//        
//        for element in self {
//            window.append(element)
//            if window.count == size {
//                result.append(window)
//                window.removeFirst()
//            }
//        }
//        
//        return result
//    }
//}
//
//// Example usage:
//let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let windowedArray = array.windowed(size: 3)
//print(windowedArray) // Output: [[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9]]
public struct WindowedSequence<Base: Sequence>: Sequence {
    let base: Base
    let size: Int

    init(base: Base, size: Int) {
        self.base = base
        self.size = size
    }

    public func makeIterator() -> WindowedIterator<Base.Iterator> {
        return WindowedIterator(base: base.makeIterator(), size: size)
    }
}

public struct WindowedIterator<Base: IteratorProtocol>: IteratorProtocol {
    var base: Base
    let size: Int
    var buffer: [Base.Element] = []

    init(base: Base, size: Int) {
        self.base = base
        self.size = size
    }

    public mutating func next() -> [Base.Element]? {
        while let nextElement = base.next() {
            buffer.append(nextElement)
            if buffer.count > size {
                buffer.removeFirst()
            }
            if buffer.count == size {
                return buffer
            }
        }
        return nil
    }
}

public struct Window2Sequence<Base: Sequence>: Sequence {
    let base: Base

    init(base: Base) {
        self.base = base
    }

    public func makeIterator() -> Window2Iterator<Base.Iterator> {
        return Window2Iterator(base: base.makeIterator())
    }
}

public struct Window2Iterator<Base: IteratorProtocol>: IteratorProtocol {
    var base: Base
    var size = 0
    var buffer: Base.Element?

    init(base: Base) {
        self.base = base
        buffer = self.base.next()
    }

    mutating public func next() -> (Base.Element, Base.Element)? {
        if let nextElement = base.next() {
            guard let buffer else {
                return nil
            }
            let temp = buffer
            self.buffer = nextElement
            return (temp, nextElement)
        } else {
            return nil
        }
    }
}

public extension Sequence {
    func window(size: Int) -> WindowedSequence<Self> {
        return WindowedSequence(base: self, size: size)
    }
    
    func window2() -> Window2Sequence<Self> {
        Window2Sequence(base: self)
    }
}
