/*
 * @lc app=leetcode id=88 lang=swift
 *
 * [88] Merge Sorted Array
 *
 * https://leetcode.com/problems/merge-sorted-array/description/
 *
 * algorithms
 * Easy (39.05%)
 * Likes:    2589
 * Dislikes: 4419
 * Total Accepted:    663.5K
 * Total Submissions: 1.7M
 * Testcase Example:  '[1,2,3,0,0,0]\n3\n[2,5,6]\n3'
 *
 * Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as
 * one sorted array.
 * 
 * Note:
 * 
 * 
 * The number of elements initialized in nums1 and nums2 are m and n
 * respectively.
 * You may assume that nums1 has enough space (size that is equal to m + n) to
 * hold additional elements from nums2.
 * 
 * 
 * Example:
 * 
 * 
 * Input:
 * nums1 = [1,2,3,0,0,0], m = 3
 * nums2 = [2,5,6],       n = 3
 * 
 * Output: [1,2,2,3,5,6]
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * -10^9 <= nums1[i], nums2[i] <= 10^9
 * nums1.length == m + n
 * nums2.length == n
 * 
 * 
 */

// @lc code=start
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var k = m + n - 1
        while i >= 0 && j >= 0 {
            if nums1[i] <= nums2[j] {
                nums1[k] = nums2[j]
                k -= 1
                j -= 1
            } else {
                nums1[k] = nums1[i]
                k -= 1
                i -= 1
            }
        }

        while j >= 0 {
            nums1[j] = nums2[j]
            j -= 1
        }
    }
}
// @lc code=end

