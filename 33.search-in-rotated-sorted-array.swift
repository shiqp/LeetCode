/*
 * @lc app=leetcode id=33 lang=swift
 *
 * [33] Search in Rotated Sorted Array
 */
extension Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.endIndex - 1
        while low <= high {
            let mid = (low + high) / 2
            if nums[mid] == target {
                return mid
            }

            if nums[low] < nums[high] {
                if nums[mid] < target {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            } else {
                if nums[mid] > nums[high] {
                    if nums[low] <= target && target < nums[mid] {
                        high = mid - 1
                    } else {
                        low = mid + 1
                    }
                } else {
                    if nums[mid] < target && target <= nums[high] {
                        low = mid + 1
                    } else {
                        high = mid - 1
                    }
                }
            }
        }
        
        return -1
    }
}

