/*
 * @lc app=leetcode id=81 lang=swift
 *
 * [81] Search in Rotated Sorted Array II
 *
 * https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
 *
 * algorithms
 * Medium (32.96%)
 * Likes:    1303
 * Dislikes: 477
 * Total Accepted:    239.9K
 * Total Submissions: 727K
 * Testcase Example:  '[2,5,6,0,0,1,2]\n0'
 *
 * Suppose an array sorted in ascending order is rotated at some pivot unknown
 * to you beforehand.
 * 
 * (i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
 * 
 * You are given a target value to search. If found in the array return true,
 * otherwise return false.
 * 
 * Example 1:
 * 
 * 
 * Input: nums = [2,5,6,0,0,1,2], target = 0
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: nums = [2,5,6,0,0,1,2], target = 3
 * Output: false
 * 
 * Follow up:
 * 
 * 
 * This is a follow up problem to Search in Rotated Sorted Array, where nums
 * may contain duplicates.
 * Would this affect the run-time complexity? How and why?
 * 
 * 
 */

// @lc code=start
class Solution81 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var i = 0, j = nums.count - 1
        while i <= j {
            let mid = (i + j) / 2
            if nums[mid] == target || nums[i] == target || nums[j] == target {
                return true
            }

            while nums[mid] == nums[i] && i < mid {
                i += 1
            }

            if i >= mid {
                i = mid + 1
                continue
            }
            
            if nums[mid] > nums[i] {
                if target > nums[mid] {
                    i = mid + 1
                } else if target > nums[i] {
                    j = mid - 1
                } else {
                    i = mid + 1
                }
            } else {
                if target < nums[mid] {
                    j = mid - 1
                } else if target < nums[j] {
                    i = mid + 1
                } else {
                    j = mid - 1
                }
            }
        }

        return false
    }
}
// @lc code=end

