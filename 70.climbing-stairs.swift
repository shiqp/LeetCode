/*
 * @lc app=leetcode id=70 lang=swift
 *
 * [70] Climbing Stairs
 *
 * https://leetcode.com/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (46.93%)
 * Likes:    4146
 * Dislikes: 135
 * Total Accepted:    666K
 * Total Submissions: 1.4M
 * Testcase Example:  '2'
 *
 * You are climbing a stair case. It takes n steps to reach to the top.
 * 
 * Each time you can either climb 1 or 2 steps. In how many distinct ways can
 * you climb to the top?
 * 
 * Note: Given n will be a positive integer.
 * 
 * Example 1:
 * 
 * 
 * Input: 2
 * Output: 2
 * Explanation: There are two ways to climb to the top.
 * 1. 1 step + 1 step
 * 2. 2 steps
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: 3
 * Output: 3
 * Explanation: There are three ways to climb to the top.
 * 1. 1 step + 1 step + 1 step
 * 2. 1 step + 2 steps
 * 3. 2 steps + 1 step
 * 
 * 
 */

// @lc code=start
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }

        if n == 2 {
            return 2
        }

        var steps = [Int](repeating: 1, count: n)
        steps[1] = 2
        for i in 2..<n {
            steps[i] = steps[i - 1] + steps[i - 2]
        }

        return steps[n - 1]
    }
}
// @lc code=end

