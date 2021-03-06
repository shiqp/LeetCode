/*
 * @lc app=leetcode id=55 lang=swift
 *
 * [55] Jump Game
 *
 * https://leetcode.com/problems/jump-game/description/
 *
 * algorithms
 * Medium (32.78%)
 * Likes:    2621
 * Dislikes: 250
 * Total Accepted:    327.6K
 * Total Submissions: 998.2K
 * Testcase Example:  '[2,3,1,1,4]'
 *
 * Given an array of non-negative integers, you are initially positioned at the
 * first index of the array.
 * 
 * Each element in the array represents your maximum jump length at that
 * position.
 * 
 * Determine if you are able to reach the last index.
 * 
 * Example 1:
 * 
 * 
 * Input: [2,3,1,1,4]
 * Output: true
 * Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last
 * index.
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: [3,2,1,0,4]
 * Output: false
 * Explanation: You will always arrive at index 3 no matter what. Its
 * maximum
 * jump length is 0, which makes it impossible to reach the last index.
 * 
 * 
 */

// @lc code=start
class Solution55 {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return true
        }

        var dp = 0
        for i in 0..<nums.count - 1 {
            dp = max(dp - 1, nums[i])
            if dp == 0 {
                return false
            }
        }

        return true
    }
}
// @lc code=end

