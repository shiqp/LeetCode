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

}