/*
 * @lc app=leetcode id=84 lang=swift
 *
 * [84] Largest Rectangle in Histogram
 *
 * https://leetcode.com/problems/largest-rectangle-in-histogram/description/
 *
 * algorithms
 * Hard (34.51%)
 * Likes:    3769
 * Dislikes: 86
 * Total Accepted:    266.9K
 * Total Submissions: 763.1K
 * Testcase Example:  '[2,1,5,6,2,3]'
 *
 * Given n non-negative integers representing the histogram's bar height where
 * the width of each bar is 1, find the area of largest rectangle in the
 * histogram.
 * 
 * 
 * 
 * 
 * Above is a histogram where width of each bar is 1, given height =
 * [2,1,5,6,2,3].
 * 
 * 
 * 
 * 
 * The largest rectangle is shown in the shaded area, which has area = 10
 * unit.
 * 
 * 
 * 
 * Example:
 * 
 * 
 * Input: [2,1,5,6,2,3]
 * Output: 10
 * 
 * 
 */

// @lc code=start
class Solution84 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var result = 0

        var heights = heights
        heights.append(0)

        var stack = [Int]()
        var i = 0
        while i < heights.count {
            if stack.isEmpty || heights[stack.last!] <= heights[i] {
                stack.append(i)
                i += 1
                continue
            }

            let j = stack.removeLast()
            let length = stack.isEmpty ? i : i - stack.last! - 1
            result = max(result, heights[j] * length)
        }

        return result
    }
}
// @lc code=end

