//
//  Int+ex.swift
//  fisher
//
//  Created by wangwenjian on 2023/12/11.
//

import Foundation
import UIKit
import SwiftUI


extension Int {
    
    @available(iOS 13.0, *)
    var font: Font {
        return self.font()
    }
    
    @available(iOS 13.0, *)
    func font(_ weight: Font.Weight = .regular ) -> Font {
        return Font.system(size: CGFloat(self)).weight(weight)
    }
    
    var uiFont: UIFont {
        return self.uiFont()
    }
    
    func uiFont(_ weight: UIFont.Weight? = nil ) -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat(self), weight: weight ?? .regular)
    }
    
    var uiColor: UIColor {
        if self > 0xFFFFFF {
            return UIColor(rgbaHex: self)
        } else {
            return UIColor(rgbHex: self)
        }
    }
    
    @available(iOS 13.0, *)
    var color: Color {
        return Color(self.uiColor)
    }
    
    
}
