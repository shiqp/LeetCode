/*
 * @lc app=leetcode id=11 lang=swift
 *
 * [11] Container With Most Water
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.endIndex - 1
        var area = 0

        while i < j {
            let width = j - i
            
            var h = 0
            if height[i] < height[j] {
                h = height[i]
                i += 1
            } else {
                h = height[j]
                j -= 1
            }

            let currentArea = width * h
            area = area < currentArea ? currentArea : area
        }

        return area
    }
}

