import Foundation

enum Device {
    case iPhone8plus
    case iPhone13mini
    case iPhone15
    case iPhone15Pro
    case iPhone15ProMax
    case iPadMini6
    case iPadMini6_Horizontal
    case iPadPro11inch
    case iPadPro11inch_Horizontal
    
    struct DeviceInfo {
        let name: String
        let size: CGSize
        let statusBarHeight: CGFloat
        let safeAreaBottom: CGFloat
        let uiSizeClass: UISizeClass
        enum UISizeClass: String {
            case regular
            case large
            case huge
            case max
        }
    }
    
    private var deviceInfo: DeviceInfo {
        switch self {
        case .iPhone8plus:
            return DeviceInfo(name: "iPhone 8 Plus", size: CGSize(width: 414, height: 736), statusBarHeight: 20, safeAreaBottom: 0, uiSizeClass: .regular)
        case .iPhone13mini:
            return DeviceInfo(name: "iPhone 13 mini", size: CGSize(width: 375, height: 812), statusBarHeight: 44, safeAreaBottom: 34, uiSizeClass: .regular)
        case .iPhone15:
            return DeviceInfo(name: "iPhone 15", size: CGSize(width: 390, height: 844), statusBarHeight: 44, safeAreaBottom: 34, uiSizeClass: .regular)
        case .iPhone15Pro:
            return DeviceInfo(name: "iPhone 15 Pro", size: CGSize(width: 428, height: 926), statusBarHeight: 44, safeAreaBottom: 34, uiSizeClass: .regular)
        case .iPhone15ProMax:
            return DeviceInfo(name: "iPhone 15 Pro Max", size: CGSize(width: 428, height: 926), statusBarHeight: 44, safeAreaBottom: 34, uiSizeClass: .regular)
        case .iPadMini6:
            return DeviceInfo(name: "iPad Mini 6", size: CGSize(width: 744, height: 1080), statusBarHeight: 20, safeAreaBottom: 0, uiSizeClass: .large)
        case .iPadMini6_Horizontal:
            return DeviceInfo(name: "iPad Mini 6", size: CGSize(width: 1080, height: 744), statusBarHeight: 20, safeAreaBottom: 0, uiSizeClass: .huge)
        case .iPadPro11inch:
            return DeviceInfo(name: "iPad Pro 11 inch", size: CGSize(width: 834, height: 1194), statusBarHeight: 20, safeAreaBottom: 0, uiSizeClass: .huge)
        case .iPadPro11inch_Horizontal:
            return DeviceInfo(name: "iPad Pro 11 inch", size: CGSize(width: 1194, height: 834), statusBarHeight: 20, safeAreaBottom: 0, uiSizeClass: .max)
        }
    }
    
    var name: String {
        return deviceInfo.name
    }
    
    var size: CGSize {
        return deviceInfo.size
    }
    
    var statusBarHeight: CGFloat {
        return deviceInfo.statusBarHeight
    }
    
    var safeAreaBottom: CGFloat {
        return deviceInfo.safeAreaBottom
    }
    
    var uiSizeClass: DeviceInfo.UISizeClass {
        return deviceInfo.uiSizeClass
    }
}

extension Device {
    var isiPad: Bool {
        switch self {
        case .iPhone8plus, .iPhone13mini, .iPhone15, .iPhone15Pro, .iPhone15ProMax:
            return false
         case .iPadMini6, .iPadMini6_Horizontal, .iPadPro11inch, .iPadPro11inch_Horizontal:
            return true
        }
    }
}
