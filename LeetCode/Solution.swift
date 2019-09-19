//
//  Array.swift
//  LeetCode
//
//  Created by Qingpu Shi on 2019/5/23.
//  Copyright © 2019 Qingpu Shi. All rights reserved.
//

import UIKit

class Solution {
    /// Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
    ///
    /// - Parameter digits: A non-empty array of digits representing a non-negative integer.
    /// - Returns: Plus one to the integer.
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        while i >= 0 {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            } else {
                digits[i] = 0
                i -= 1
            }
        }

        digits.insert(1, at: 0)
        return digits
    }

    /// Given two binary strings, return their sum (also a binary string).
    ///
    /// - Parameters:
    ///   - a: Binary string a.
    ///   - b: Binary string b.
    /// - Returns: Binary string representing the sum of a and b.
    func addBinary(_ a: String, _ b: String) -> String {
        var i = a.endIndex
        var j = b.endIndex

        var sum = ""
        var carry = "0"
        while i != a.startIndex || j != b.startIndex {
            var count = carry == "1" ? 1 : 0
            if i != a.startIndex {
                i = a.index(before: i)
                count += a[i] == "1" ? 1 : 0
            }

            if j != b.startIndex {
                j = b.index(before: j)
                count += b[j] == "1" ? 1 : 0
            }

            switch count {
            case 0:
                sum.insert("0", at: sum.startIndex)
                carry = "0"
            case 1:
                sum.insert("1", at: sum.startIndex)
                carry = "0"
            case 2:
                sum.insert("0", at: sum.startIndex)
                carry = "1"
            default:
                sum.insert("1", at: sum.startIndex)
                carry = "1"
            }
        }

        if carry == "1" {
            sum.insert("1", at: sum.startIndex)
        }

        return sum
    }
}
