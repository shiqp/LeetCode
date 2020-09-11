/*
 * @lc app=leetcode id=85 lang=swift
 *
 * [85] Maximal Rectangle
 *
 * https://leetcode.com/problems/maximal-rectangle/description/
 *
 * algorithms
 * Hard (37.08%)
 * Likes:    2620
 * Dislikes: 67
 * Total Accepted:    172.1K
 * Total Submissions: 464.1K
 * Testcase Example:  '[["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]'
 *
 * Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle
 * containing only 1's and return its area.
 * 
 * Example:
 * 
 * 
 * Input:
 * [
 * ⁠ ["1","0","1","0","0"],
 * ⁠ ["1","0","1","1","1"],
 * ⁠ ["1","1","1","1","1"],
 * ⁠ ["1","0","0","1","0"]
 * ]
 * Output: 6
 * 
 * 
 */

// @lc code=start
class Solution85 {
    func maximalArea(_ heights: [Int]) -> Int {
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

    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty {
            return 0
        }

        var result = 0

        var heights = [Int](repeating: 0, count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                heights[j] = matrix[i][j] == "0" ? 0 : heights[j] + 1
            }

            result = max(result, maximalArea(heights))
        }

        return result
    }
}
// @lc code=end

