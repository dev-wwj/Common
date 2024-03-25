//
//  UIView+animate.swift
//  fisherman
//
//  Created by wwj on 17.1.24.
//

import UIKit


public extension UIView {
    
        
    func animate_Beat() {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.1
        animation.duration = 0.2
        animation.autoreverses = true
        self.layer.add(animation, forKey: "animate_Beat")
    }
    
}


