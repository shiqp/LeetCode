/*
 * @lc app=leetcode id=34 lang=swift
 *
 * [34] Find First and Last Position of Element in Sorted Array
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = -1
        var end = -1

        var low = 0
        var high = nums.endIndex - 1
        while low <= high {
            let mid = (low + high) / 2
            if nums[mid] > target {
                high = mid - 1
                continue
            }

            if nums[mid] < target {
                low = mid + 1
                continue
            }

            var sLow = low
            var sHigh = mid
            while start == -1 || nums[start] != target || (start != 0 && nums[start - 1] == target) {
                start = (sLow + sHigh) / 2
                if nums[start] == target {
                    sHigh = start - 1
                } else {
                    sLow = start + 1
                }
            }

            var eLow = mid
            var eHigh = high
            while end == -1 || nums[end] != target || (end != nums.endIndex - 1 && nums[end + 1] == target) {
                end = (eLow + eHigh) / 2
                if nums[end] == target {
                    eLow = end + 1
                } else {
                    eHigh = end - 1
                }
            }

            break
        }

        return [start, end]
    }
}

