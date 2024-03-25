//
//  UIViewController.swift
//  fisher
//
//  Created by wangwenjian on 2023/12/14.
//

import Foundation
import UIKit

public extension UIViewController {
    var isPresented: Bool {
        return self.isViewLoaded && self.view.window != nil
    }
}
