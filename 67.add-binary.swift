/*
 * @lc app=leetcode id=67 lang=swift
 *
 * [67] Add Binary
 */
class Solution67 {
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

