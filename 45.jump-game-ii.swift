/*
 * @lc app=leetcode id=45 lang=swift
 *
 * [45] Jump Game II
 *
 * https://leetcode.com/problems/jump-game-ii/description/
 *
 * algorithms
 * Hard (29.13%)
 * Likes:    1585
 * Dislikes: 87
 * Total Accepted:    203.2K
 * Total Submissions: 697.3K
 * Testcase Example:  '[2,3,1,1,4]'
 *
 * Given an array of non-negative integers, you are initially positioned at the
 * first index of the array.
 * 
 * Each element in the array represents your maximum jump length at that
 * position.
 * 
 * Your goal is to reach the last index in the minimum number of jumps.
 * 
 * Example:
 * 
 * 
 * Input: [2,3,1,1,4]
 * Output: 2
 * Explanation: The minimum number of jumps to reach the last index is 2.
 * ⁠   Jump 1 step from index 0 to 1, then 3 steps to the last index.
 * 
 * Note:
 * 
 * You can assume that you can always reach the last index.
 * 
 */

// @lc code=start
class Solution45 {
    func jump(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: Int.max, count: nums.count)
        dp[0] = 0
        
        var jumpToEndIndex = false
        for i in 0..<nums.count {
            if nums[i] == 0 {
                continue
            }

            jumpToEndIndex = false
            for j in 1...nums[i] {
                if i + j >= nums.count {
                    jumpToEndIndex = true
                    break
                } else if dp[i + j] > dp[i] + 1 {
                    dp[i + j] = dp[i] + 1
                }
            }

            if jumpToEndIndex {
                break
            }
        }

        return dp.last!
    }
}
// @lc code=end

