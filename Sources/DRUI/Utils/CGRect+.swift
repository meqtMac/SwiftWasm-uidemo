//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/14.
//

import Foundation


public extension CGPoint {
     static var zero: Self {
         return CGPoint(x: 0, y: 0)
    }
}

//extension CGRect {
//}

public extension DRView {
    var left: CGFloat {
        get {
            frame.left
        }
        set {
            frame.left = newValue
        }
    }
    
    var right: CGFloat {
        get {
            frame.right
        }
        set {
            frame.right = newValue
        }
    }
    
    var top: CGFloat {
        get {
            frame.top
        }
        set {
            frame.top = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            frame.bottom
        }
        set {
            frame.bottom = newValue
        }
    }
    
    var centerX: CGFloat {
        get {
            frame.centerX
        }
        set {
            frame.centerX = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            frame.centerY
        }
        set {
            frame.centerY = newValue
        }
    }
    
    var height: CGFloat {
        get {
            frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var width: CGFloat {
        get {
            frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var center: CGPoint {
        get {
            frame.center
        }
        set {
            frame.centerX = newValue.x
            frame.centerY = newValue.y
        }
    }
    
    var size: CGSize {
        get {
            frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
}

extension CGRect {
    var left: CGFloat {
        get {
            self.origin.x
        }
        mutating set {
            self.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            self.origin.x + self.size.width
        }
        mutating set {
            self.origin.x += newValue - (self.origin.x + self.size.width)
        }
    }
    
    var top: CGFloat {
        get {
            self.origin.y
        }
        mutating set {
            self.origin.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            self.origin.y + self.height
        }
        mutating set {
            self.origin.y += newValue - (self.origin.y + self.height)
        }
    }
    
    var center: CGPoint {
        get {
            CGPoint(x: centerX, y: centerY)
        }
        set {
            centerX = newValue.x
            centerY = newValue.y
        }
    }

    var height: CGFloat {
        get {
            self.size.height
        }
        set {
            self.size.height = newValue
        }
    }

    var width: CGFloat {
        get {
            self.size.width
        }
        set {
            self.size.width = newValue
        }
    }
    
   var centerX: CGFloat {
        get {
            self.origin.x + self.width / 2
        }
        set {
            self.origin.x += newValue - (self.origin.x + self.width / 2)
        }
    }
    
    var centerY: CGFloat {
        get {
            self.origin.y + self.height / 2
        }
        set {
            self.origin.y += newValue - (self.origin.y + self.height / 2)
        }
    }
}
