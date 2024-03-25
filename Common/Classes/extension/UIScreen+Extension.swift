//
//  UIScreen+Extension.swift
//  fisherman
//
//  Created by wwj on 17.1.24.
//

import UIKit

public extension UIScreen {
    
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
    static var safebottom: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    }
    
    enum ScreenShape: Int {
        case Notch = 1      // 刘海
        case Island = 2     // 灵动岛
        case none = 0       // 默认
    }
    
    /**
    屏幕形状
     */
    static var screenShape: ScreenShape {
        switch UIDevice.deviceName {
        case .iPhoneX1:
            return .Notch
        case .iPhoneX2:
            return .Notch
        case .iPhoneXs:
            return .Notch
        case .iPhoneXsMax1:
            return .Notch
        case .iPhoneXsMax2:
            return .Notch
        case .iPhoneXR:
            return .Notch
        case .iPhone11:
            return .Notch
        case .iPhone11Pro:
            return .Notch
        case .iPhone11ProMax:
            return .Notch
        case .iPhone12Mini:
            return .Notch
        case .iPhone12:
            return .Notch
        case .iPhone12Pro:
            return .Notch
        case .iPhone12ProMax:
            return .Notch
        case .iPhone13Mini:
            return .Notch
        case .iPhone13:
            return .Notch
        case .iPhone13Pro:
            return .Notch
        case .iPhone13ProMax:
            return .Notch
        case .iPhone14:
            return .Notch
        case .iPhone14Plus:
            return .Notch
        case .iPhone14Pro:
            return .Island
        case .iPhone14ProMax:
            return .Island
        case .iPhone15:
            return .Island
        case .iPhone15Plus:
            return .Island
        case .iPhone15Pro:
            return .Island
        case .iPhone15ProMax:
            return .Island
        }
    }
    
    /**
     刘海 宽度
     */
    static var notchWidth: CGFloat {
        switch UIDevice.deviceName {
        case .iPhoneX1:
            return 230
        case .iPhoneX2:
            return 230
        case .iPhoneXs:
            return 230
        case .iPhoneXsMax1:
            return 210
        case .iPhoneXsMax2:
            return 210
        case .iPhoneXR:
            return 230
        case .iPhone11:
            return 230
        case .iPhone11Pro:
            return 210
        case .iPhone11ProMax:
            return 210
        case .iPhone12Mini:
            return 228
        case .iPhone12:
            return 210
        case .iPhone12Pro:
            return 210
        case .iPhone12ProMax:
            return 162
        case .iPhone13Mini:
            return 230
        case .iPhone13:
            return 210
        case .iPhone13Pro:
            return 210
        case .iPhone13ProMax:
            return 162
        case .iPhone14:
            return 162
        case .iPhone14Plus:
            return 162
        default:
            return 0
        }
    }
    
    /**
     刘海高度
     */
    static var notchHeight: CGFloat {
        switch UIDevice.deviceName {
        case .iPhoneX1:
            return 32
        case .iPhoneX2:
            return 32
        case .iPhoneXR:
            return 32
        case .iPhone11:
            return 34
        case .iPhone12Mini:
            return 34
        case .iPhone12Pro:
            return 32
        default:
            return 34
        }
    }
    
    /**
     屏幕圆角
     */
    private static var cornerRadius: CGFloat {
        switch UIDevice.deviceName {
        case .iPhoneX1:
            return 40
        case .iPhoneX2:
            return 40
        case .iPhoneXs:
            return 40
        case .iPhoneXsMax1:
            return 40
        case .iPhoneXsMax2:
            return 54
        case .iPhoneXR:
            return 40
        case .iPhone11:
            return 40
        case .iPhone11Pro:
            return 48
        case .iPhone11ProMax:
            return 48
        case .iPhone12Mini:
            return 44
        case .iPhone12:
            return 48
        case .iPhone12Pro:
            return 48
        case .iPhone12ProMax:
            return 54
        case .iPhone13Mini:
            return 44
        case .iPhone13:
            return 48
        case .iPhone13Pro:
            return 48
        case .iPhone13ProMax:
            return 54
        case .iPhone14:
            return 48
        case .iPhone14Plus:
            return 54
        case .iPhone14Pro:
            return 54
        case .iPhone14ProMax:
            return 54
        case .iPhone15:
            return 54
        case .iPhone15Plus:
            return 54
        case .iPhone15Pro:
            return 56
        case .iPhone15ProMax:
            return 56
        }
    }

}

public extension UIScreen {
    
    struct DynamicIsland {
        /// The size of the Dynamic Island cutout.
        static var size: CGSize  {
          return .init(width: 126.0, height: 37.33)
        }
        
        /// The starting position of the Dynamic Island cutout.
        static var origin: CGPoint  {
          return .init(x: UIScreen.main.bounds.midX - size.width / 2, y: 11)
        }
        
        /// A rect that has the size and position of the Dynamic Island cutout.
        static var rect: CGRect  {
          return .init(origin: origin, size: size)
        }
        
        /// The corner radius of the Dynamic Island cutout.
        static var cornerRadius: CGFloat {
          return size.width / 2
        }
    }
    
    static var dynamicIslandPath: UIBezierPath {
        return UIBezierPath(roundedRect: DynamicIsland.rect, cornerRadius: DynamicIsland.cornerRadius)
    }
    
}
