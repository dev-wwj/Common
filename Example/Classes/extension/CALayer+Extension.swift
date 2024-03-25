//
//  CALayer+Extension.swift
//  fisherman
//
//  Created by wwj on 15.1.24.
//

import UIKit


extension CALayer {
    
    private static var keyLineLayer: Int = "keyLineLayer".hashValue
    
    private static var keyLinePath: Int = "keyLinePath".hashValue

}

extension CALayer {
    
    struct LineConfig {
        let path: UIBezierPath?
        let lineWidth: CGFloat?
        let color: CGColor?
    }
    
    
    private var keyLineLayer: CALayer? {
        set {
            objc_setAssociatedObject(self, &Self.keyLineLayer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &Self.keyLineLayer) as? CALayer
        }
    }
    
    private var borderPath: UIBezierPath {
        return UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius)
    }
    
    
    func add(line config: LineConfig) {
        guard  self.bounds != .zero else {
            return
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = config.path?.cgPath ?? borderPath.cgPath
        shapeLayer.lineWidth = config.lineWidth ?? borderWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = config.color ?? borderColor
        addSublayer(shapeLayer)
        self.keyLineLayer = shapeLayer
    }
    
}
