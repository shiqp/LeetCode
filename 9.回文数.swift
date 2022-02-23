/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }

        if x < 10 {
            return true
        }

        var y = x
        var z = 1
        while y >= 10 {
            z *= 10
            y = y / 10
        }

        y = x
        while y != 0 {
            let front = y / z
            let end = y % 10
            if front != end {
                return false
            }

            y = (y - front * z) / 10
            z = z / 100
        }

        return true
    }
}
// @lc code=end

