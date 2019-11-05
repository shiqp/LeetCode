/*
 * @lc app=leetcode id=66 lang=swift
 *
 * [66] Plus One
 */
class Solution66 {
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
}

