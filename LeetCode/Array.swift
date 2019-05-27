//
//  Array.swift
//  LeetCode
//
//  Created by Qingpu Shi on 2019/5/23.
//  Copyright © 2019 Qingpu Shi. All rights reserved.
//

import UIKit

class Array: NSObject {
    
    /// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
    /// You may assume that each input would have exactly one solution, and you may not use the same element twice.
    ///
    /// - Parameters:
    ///   - nums: An array of integers.
    ///   - target: The specific target.
    /// - Returns: The indices of the two numbers.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()

        for i in 0..<nums.count {
            let num = target - nums[i]
            if let j = map[num] {
                return [j ,i]
            }

            map[nums[i]] = i
        }

        return [Int]()
    }

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

}
