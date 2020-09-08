/*
 * @lc app=leetcode id=7 lang=swift
 *
 * [7] Reverse Integer
 *
 * https://leetcode.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (25.74%)
 * Likes:    3309
 * Dislikes: 5226
 * Total Accepted:    1.1M
 * Total Submissions: 4.3M
 * Testcase Example:  '123'
 *
 * Given a 32-bit signed integer, reverse digits of an integer.
 * 
 * Example 1:
 * 
 * 
 * Input: 123
 * Output: 321
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: -123
 * Output: -321
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: 120
 * Output: 21
 * 
 * 
 * Note:
 * Assume we are dealing with an environment which could only store integers
 * within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose
 * of this problem, assume that your function returns 0 when the reversed
 * integer overflows.
 * 
 */

// @lc code=start
class Solution7 {
    func reverse(_ x: Int) -> Int {
        var result = 0
        var y = x
        while y != 0 {
            if result > Int32.max / 10 || result < Int32.min / 10 {
                return 0
            }
            result = result * 10 + y % 10
            y = y / 10
        }

        return result
    }
}
// @lc code=end

