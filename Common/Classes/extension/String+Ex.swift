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

public extension String {
    /// KMP 查找字符串
    /// - Parameter p: 子字符串
    /// - Returns: 子字符串所在位置集合
    func kmpFindAll(_ p: String) -> [NSRange] {
        var ranges: [NSRange] = []
        let n = self.count
        let m = p.count
        let t = computePrefix(p)
        var q = 0
        for i in 0 ..< n {
            while q > 0, p.getCharacter(q) != self.getCharacter(i) {
                q = t[q]
            }
            if p.getCharacter(q) == self.getCharacter(i) {
                q += 1
            }
            if q == m {
                ranges.append(NSRange(location: i + 1 - m, length: m))
                q = t[q]
            }
        }
        return ranges
    }

    /// 计算KMP 对应前缀函数 数组
    /// - Parameter p:
    /// - Returns:
    fileprivate func computePrefix(_ p: String) -> [Int] {
        let m = p.count
        var t = Array(repeating: 0, count: m + 1)
        var k = 0
        for q in 1 ..< m {
            while k > 0, p.getCharacter(k) != p.getCharacter(q) {
                k = t[k]
            }
            if p.getCharacter(k) == p.getCharacter(q) {
                k += 1
            }
            t[q] = k
        }
        return t
    }

    /// 获取字符串中的字符
    /// - Parameter index: 字符位置
    /// - Returns: 字符
    fileprivate func getCharacter(_ index: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: index)
        return self[index]
    }
}
