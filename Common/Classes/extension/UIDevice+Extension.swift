//
//  UIDevice+Extension.swift
//  fisherman
//
//  Created by wwj on 15.1.24.
//

import UIKit

public enum DeviceName: String {
    case iPhoneX1 = "iPhone10,3"
    case iPhoneX2 = "iPhone10,6"
    case iPhoneXs = "iPhone11,2"
    case iPhoneXsMax1 = "iPhone11,4"
    case iPhoneXsMax2 = "iPhone11,6"
    case iPhoneXR = "iPhone11,8"
    case iPhone11 = "iPhone12,1"
    case iPhone11Pro = "iPhone12,3"
    case iPhone11ProMax = "iPhone12,5"
    case iPhone12Mini = "iPhone13,1"
    case iPhone12 = "iPhone13,2"
    case iPhone12Pro = "iPhone13,3"
    case iPhone12ProMax = "iPhone13,4"
    case iPhone13Mini = "iPhone14,4"
    case iPhone13 = "iPhone14,5"
    case iPhone13Pro = "iPhone14,2"
    case iPhone13ProMax = "iPhone14,3"
    case iPhone14 = "iPhone14,7"
    case iPhone14Plus = "iPhone14,8"
    case iPhone14Pro = "iPhone15,2"
    case iPhone14ProMax = "iPhone15,3"
    case iPhone15 = "iPhone15,4"
    case iPhone15Plus = "iPhone15,5"
    case iPhone15Pro = "iPhone16,1"
    case iPhone15ProMax = "iPhone16,2"
}

public extension UIDevice {
    
   static var deviceName: DeviceName {
        var sysInfo = utsname()
        uname(&sysInfo)
        let machineMirror = Mirror(reflecting: sysInfo.machine)
        let identifier = machineMirror.children.reduce("") { partialResult, element in
            guard let value = element.value as? Int8, value != 0 else {
                return partialResult
            }
            return partialResult + String(UnicodeScalar(UInt8(value)))
        }
        let result: String
        switch identifier {
        case "i386", "x86_64", "arm64":
            result = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? identifier
        default: 
            result = identifier
        }
        return .init(rawValue: result)!
    }
}
