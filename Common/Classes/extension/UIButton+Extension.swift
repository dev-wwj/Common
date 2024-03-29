//
//  UIButton+Extension.swift
//  SwiftLearnDemo
//
//  Created by wangwenjian on 2024/3/29.
//

import UIKit

public extension UIButton {
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }

    @discardableResult
    func title(_ title: String?, for state: UIControl.State) -> Self {
        self.setTitle(title, for: state)
        return self
    }

    @discardableResult
    func titleColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setImage(image, for: state)
        return self
    }

    @discardableResult
    func bgImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
}

public extension UIButton {
    /// 图片 和 title 的布局样式
    enum ImgLayout {
        case top
        case left
        case bottom
        case right
    }
    
    /// 按钮图片/标题位置调整
    /// - Parameters:
    ///   - imageAlignment: 图文排列方式
    ///   - spacing: 图文间距
    func imageLayout(_ alignment: ImgLayout, spacing: CGFloat = 0) {
        guard let imageSize = self.imageView?.image?.size,
              let titleSize = self.titleLabel?.intrinsicContentSize
        else {
            return
        }

        switch alignment {
        case .top, .bottom:
            let imageVerticalOffset = (titleSize.height + spacing)/2
            let titleVerticalOffset = (imageSize.height + spacing)/2
            let imageHorizontalOffset = (titleSize.width)/2
            let titleHorizontalOffset = (imageSize.width)/2
            let sign: CGFloat = alignment == .top ? 1 : -1

            self.imageEdgeInsets = UIEdgeInsets(top: -imageVerticalOffset * sign,
                                                left: imageHorizontalOffset,
                                                bottom: imageVerticalOffset * sign,
                                                right: -imageHorizontalOffset)
            self.titleEdgeInsets = UIEdgeInsets(top: titleVerticalOffset * sign,
                                                left: -titleHorizontalOffset,
                                                bottom: -titleVerticalOffset * sign,
                                                right: titleHorizontalOffset)
        case .left:
            let edgeOffset = spacing/2
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -edgeOffset,
                                                bottom: 0,
                                                right: edgeOffset)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: edgeOffset,
                                                bottom: 0,
                                                right: -edgeOffset)
        case .right:
            let edgeOffset = spacing/2
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: titleSize.width + edgeOffset,
                                                bottom: 0,
                                                right: -titleSize.width - edgeOffset)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -imageSize.width - edgeOffset,
                                                bottom: 0,
                                                right: imageSize.width + edgeOffset)
        }
    }
}
