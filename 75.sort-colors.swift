/*
 * @lc app=leetcode id=75 lang=swift
 *
 * [75] Sort Colors
 *
 * https://leetcode.com/problems/sort-colors/description/
 *
 * algorithms
 * Medium (46.80%)
 * Likes:    3300
 * Dislikes: 221
 * Total Accepted:    503.4K
 * Total Submissions: 1.1M
 * Testcase Example:  '[2,0,2,1,1,0]'
 *
 * Given an array with n objects colored red, white or blue, sort them in-place
 * so that objects of the same color are adjacent, with the colors in the order
 * red, white and blue.
 * 
 * Here, we will use the integers 0, 1, and 2 to represent the color red,
 * white, and blue respectively.
 * 
 * Note: You are not suppose to use the library's sort function for this
 * problem.
 * 
 * Example:
 * 
 * 
 * Input: [2,0,2,1,1,0]
 * Output: [0,0,1,1,2,2]
 * 
 * Follow up:
 * 
 * 
 * A rather straight forward solution is a two-pass algorithm using counting
 * sort.
 * First, iterate the array counting number of 0's, 1's, and 2's, then
 * overwrite array with total number of 0's, then 1's and followed by 2's.
 * Could you come up with a one-pass algorithm using only constant space?
 * 
 * 
 */

// @lc code=start
class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }

        var low = 0, high = nums.count - 1
        var i = low

        while i <= high {
            if nums[i] == 0 {
                nums[i] = nums[low]
                nums[low] = 0
                i += 1
                low += 1
            } else if nums[i] == 2 {
                nums[i] = nums[high]
                nums[high] = 2
                high -= 1
            } else {
                i += 1
            }
        }
    }
}
// @lc code=end

