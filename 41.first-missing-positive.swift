/*
 * @lc app=leetcode id=41 lang=swift
 *
 * [41] First Missing Positive
 *
 * https://leetcode.com/problems/first-missing-positive/description/
 *
 * algorithms
 * Hard (30.09%)
 * Likes:    2258
 * Dislikes: 664
 * Total Accepted:    256.2K
 * Total Submissions: 851.3K
 * Testcase Example:  '[1,2,0]'
 *
 * Given an unsorted integer array, find the smallest missing positive
 * integer.
 * 
 * Example 1:
 * 
 * 
 * Input: [1,2,0]
 * Output: 3
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: [3,4,-1,1]
 * Output: 2
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: [7,8,9,11,12]
 * Output: 1
 * 
 * 
 * Note:
 * 
 * Your algorithm should run in O(n) time and uses constant extra space.
 * 
 */

// @lc code=start
class Solution41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            if nums[i] <= 0 {
                nums[i] = nums.count + 1
            }
        }

        for i in 0..<nums.count {
            let num = abs(nums[i]) - 1
            if num < 0 || num >= nums.count {
                continue
            }
            
            if nums[num] > 0 {
                nums[num] = -nums[num]
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}
// @lc code=end

