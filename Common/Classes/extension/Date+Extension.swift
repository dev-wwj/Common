//
//  Date+Extension.swift
//  fisherman
//
//  Created by wwj on 22.2.24.
//

import Foundation


public extension Date {
    
    static func - (left: Date, right:Date) -> TimeInterval {
        return left.timeIntervalSince1970 - right.timeIntervalSince1970
    }
}
