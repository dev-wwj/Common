//
//  String+ex.swift
//  fisher
//
//  Created by wangwenjian on 2023/12/11.
//

import Foundation
import UIKit

public extension String {
    
    var image: UIImage? {
        if self.isEmpty {
            return nil
        }
        return UIImage(named: self)
    }
    
    // 验证手机号合法性
    var isValidPhoneNumber: Bool {
        let regex = #"^1[3-9]\d{9}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    
    // 拼音输入法时,剔除末尾字母
    func recursionRemoveABC() -> String {
        var temp = self
        while let lastCharacter = temp.last,
              lastCharacter.isUppercase || lastCharacter.isLowercase || lastCharacter.isWhitespace {
            temp.removeLast()
        }
        return temp
    }
    
    func range(with range: NSRange) -> Range<String.Index>? {
        let startIndex = self.index(self.startIndex, offsetBy: range.location)
        let endIndex = self.index(startIndex, offsetBy: range.length, limitedBy: self.endIndex)
        
        // 确保计算出的结束索引有效
        guard endIndex != nil else { return nil }
        
        // 解包endIndex
        let validEndIndex = endIndex!
        
        return Range(uncheckedBounds: (lower: startIndex, upper: validEndIndex))
    }
}
