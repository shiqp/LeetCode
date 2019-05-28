/*
 * @lc app=leetcode id=26 lang=swift
 *
 * [26] Remove Duplicates from Sorted Array
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        var i = 0
        var j = 1
        while j < nums.endIndex  {
            if nums[j] > nums[i] {
                i += 1
                nums[i] = nums[j]
            }

            j += 1
        }

        return i + 1
    }
}

