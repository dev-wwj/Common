//
//  UILable+Ex.swift
//  fisher
//
//  Created by wangwenjian on 2023/12/12.
//

import Foundation
import UIKit

public extension UILabel {
    
    convenience init(text: String, font: UIFont = 17.uiFont, textColor: UIColor = 0x222222.uiColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
