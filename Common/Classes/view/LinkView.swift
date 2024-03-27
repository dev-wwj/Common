//
//  LinkView.swift
//  Common
//
//  Created by wwj on 27.3.24.
//

import Foundation
import UIKit


public class LinkView: UITextView {
    public typealias LinkTapBlock = () -> Void

    public var linkCases: [String: LinkTapBlock]? {
        didSet {
            self.setNeedsDisplay()
        }
    }

    private func loadLinkTap() {
        var attr: NSMutableAttributedString?

        if self.attributedText != nil {
            attr = NSMutableAttributedString(attributedString: self.attributedText)
        } else if text != nil {
            attr = NSMutableAttributedString(string: text)
        }

        guard let linkCases = linkCases, let attr = attr else {
            return
        }
        for (_, key) in linkCases.keys.enumerated() {
            let ranges: [NSRange] = text.kmpFindAll(key) // 查找所有子字符串 Range
            let path: String? = key.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            if path != nil {
                for range in ranges {
                    attr.addAttribute(NSAttributedString.Key.link, value: "__Link://" + path!, range: range)
                }
            }
        }
        self.isEditable = false
        self.attributedText = attr
        self.delegate = self
    }

    override public func draw(_ rect: CGRect) {
        loadLinkTap()
        super.draw(rect)
    }
}

extension LinkView: UITextViewDelegate {
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.scheme == "__Link", let key = URL.host, let block = linkCases?[key] {
            block()
        }
        return false
    }

    public func textViewDidChangeSelection(_ textView: UITextView) {
        // 禁止圈选
        textView.selectedRange.length = 0
    }
}
