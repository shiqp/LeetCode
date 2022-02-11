/*
 * @lc app=leetcode.cn id=35 lang=swift
 *
 * [35] 搜索插入位置
 *
 * https://leetcode-cn.com/problems/search-insert-position/description/
 *
 * algorithms
 * Easy (45.72%)
 * Likes:    1340
 * Dislikes: 0
 * Total Accepted:    652.8K
 * Total Submissions: 1.4M
 * Testcase Example:  '[1,3,5,6]\n5'
 *
 * 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 * 
 * 请必须使用时间复杂度为 O(log n) 的算法。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 
 * 输入: nums = [1,3,5,6], target = 5
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: nums = [1,3,5,6], target = 2
 * 输出: 1
 * 
 * 
 * 示例 3:
 * 
 * 
 * 输入: nums = [1,3,5,6], target = 7
 * 输出: 4
 * 
 * 
 * 示例 4:
 * 
 * 
 * 输入: nums = [1,3,5,6], target = 0
 * 输出: 0
 * 
 * 
 * 示例 5:
 * 
 * 
 * 输入: nums = [1], target = 0
 * 输出: 0
 * 
 * 
 * 
 * 
 * 提示:
 * 
 * 
 * 1 
 * -10^4 
 * nums 为无重复元素的升序排列数组
 * -10^4 
 * 
 * 
 */

// @lc code=start
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if nums.first! >= target {
            return 0
        }
        
        if nums.last! == target {
            return nums.count - 1
        }
        
        if nums.last! < target {
            return nums.count
        }
        
        return search(nums, target, 0, nums.count - 1)
    }
    
    func search(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        if start == end {
            return nums[start] >= target ? start : start + 1
        }
        
        if start + 1 == end {
            return nums[start] == target ? start : end
        }
        
        let mid = (start + end) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            return search(nums, target, start, mid)
        } else {
            return search(nums, target, mid, end)
        }
    }
}
// @lc code=end

