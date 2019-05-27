/*
 * @lc app=leetcode id=4 lang=swift
 *
 * [4] Median of Two Sorted Arrays
 */
class Solution {
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

