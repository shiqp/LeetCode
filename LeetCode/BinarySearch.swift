//
//  BinarySearch.swift
//  LeetCode
//
//  Created by Qingpu Shi on 2019/5/28.
//  Copyright © 2019 Qingpu Shi. All rights reserved.
//

import UIKit

class BinarySearch: NSObject {

    /// There are two sorted arrays nums1 and nums2 of size m and n respectively.
    /// Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
    /// You may assume nums1 and nums2 cannot be both empty.
    ///
    /// - Parameters:
    ///   - nums1: The sorted array nums1.
    ///   - nums2: The sorted array nums2.
    /// - Returns: The median of the two sorted arrays.
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1, nums2 = nums2
        if nums1.count > nums2.count { // Ensure nums1's count <= nums2's count
            let temp = nums1
            nums1 = nums2
            nums2 = temp
        }

        let halfCount = (nums1.count + nums2.count) / 2
        var start = -1
        var end = nums1.count - 1

        while start <= end {
            let i = (start + end) / 2
            let j = halfCount - i - 2

            if i < end && nums2[j] > nums1[i + 1] {
                start = i + 1
            } else if i > start && nums1[i] > nums2[j + 1] {
                end = i - 1
            } else {
                var minRight = 0
                if i == nums1.count - 1 {
                    minRight = nums2[j + 1]
                } else if j == nums2.count - 1 {
                    minRight = nums1[i + 1]
                } else {
                    minRight = min(nums1[i + 1], nums2[j + 1])
                }

                if (nums1.count + nums2.count) % 2 == 1 {
                    return Double(minRight)
                }

                var maxLeft = 0
                if i == -1 {
                    maxLeft = nums2[j]
                } else if j == -1 {
                    maxLeft = nums1[i]
                } else {
                    maxLeft = max(nums1[i], nums2[j])
                }

                return Double(maxLeft + minRight) / 2
            }
        }

        return 0
    }

    /// Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
    ///
    /// - Parameters:
    ///   - dividend: The dividend.
    ///   - divisor: The divisor.
    /// - Returns: The divide result.
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isPositive = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
        var dividend: Int64 = abs(Int64(dividend))
        let divisor: Int64 = abs(Int64(divisor))
        if dividend < divisor {
            return 0
        }

        var result: Int64 = 0

        while dividend >= divisor {
            var tDivisor = divisor

            var turn = 0
            while dividend >= tDivisor {
                dividend -= tDivisor
                tDivisor <<= 1
                result += 1 << turn
                turn += 1
            }
        }

        result = isPositive ? result : -result

        return result > Int32.max ? Int(Int32.max) : Int(result)
    }

    /// Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
    /// (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
    /// You are given a target value to search. If found in the array return its index, otherwise return -1.
    /// You may assume no duplicate exists in the array.
    /// Your algorithm's runtime complexity must be in the order of O(log n).
    ///
    /// - Parameters:
    ///   - nums: The nums array sorted in ascending order is rotated at some pivot unknown to you beforehand.
    ///   - target: The target.
    /// - Returns: If found in the array return its index, otherwise return -1.
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

    /// Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
    /// Your algorithm's runtime complexity must be in the order of O(log n).
    /// If the target is not found in the array, return [-1, -1].
    ///
    /// - Parameters:
    ///   - nums: The array of integers nums sorted in ascending order.
    ///   - target: The target.
    /// - Returns: The starting and ending position of the given target value. If the target is not found in the array, return [-1, -1].
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

    /// Implement pow(x, n), which calculates x raised to the power n.
    ///
    /// - Parameters:
    ///   - x: The num x.
    ///   - n: The Power n.
    /// - Returns: The result which calculates x raised to the power n.
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }

        let result = myPow(x, n / 2)
        if n % 2 == 0 {
            return result * result
        }

        if n > 0 {
            return result * result * x
        } else {
            return result * result / x
        }
    }

}
