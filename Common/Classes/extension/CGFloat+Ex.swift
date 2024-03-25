//
//  Int+ex.swift
//  fisher
//
//  Created by wangwenjian on 2023/12/11.
//

import Foundation
import UIKit

public extension CGFloat {
    
    var font: UIFont {
        return self.font()
    }
    
    func font(_ weight: UIFont.Weight? = nil ) -> UIFont {
        return UIFont.systemFont(ofSize: self, weight: weight ?? .regular)
    }
    
}

public extension CGFloat {
    
    static var circleTop: CGFloat {
        return 3/2 * .pi
    }
    
    static var circleRight: CGFloat {
        return 0
    }
    
    static var circleBottom: CGFloat {
        return 1/2 * .pi
    }
    
    static var circleLeft: CGFloat {
        return .pi
    }
    
}
