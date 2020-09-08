/*
 * @lc app=leetcode id=73 lang=swift
 *
 * [73] Set Matrix Zeroes
 *
 * https://leetcode.com/problems/set-matrix-zeroes/description/
 *
 * algorithms
 * Medium (42.76%)
 * Likes:    2006
 * Dislikes: 293
 * Total Accepted:    309.7K
 * Total Submissions: 724.1K
 * Testcase Example:  '[[1,1,1],[1,0,1],[1,1,1]]'
 *
 * Given a m x n matrix, if an element is 0, set its entire row and column to
 * 0. Do it in-place.
 * 
 * Example 1:
 * 
 * 
 * Input: 
 * [
 * [1,1,1],
 * [1,0,1],
 * [1,1,1]
 * ]
 * Output: 
 * [
 * [1,0,1],
 * [0,0,0],
 * [1,0,1]
 * ]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: 
 * [
 * [0,1,2,0],
 * [3,4,5,2],
 * [1,3,1,5]
 * ]
 * Output: 
 * [
 * [0,0,0,0],
 * [0,4,5,0],
 * [0,3,1,0]
 * ]
 * 
 * 
 * Follow up:
 * 
 * 
 * A straight forward solution using O(mn) space is probably a bad idea.
 * A simple improvement uses O(m + n) space, but still not the best
 * solution.
 * Could you devise a constant space solution?
 * 
 * 
 */

// @lc code=start
class Solution73 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let row = matrix.count
        let col = matrix.first!.count
        var isRow = false
        var isCol = false

        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0

                    if i == 0 {
                        isRow = true
                    }

                    if j == 0 {
                        isCol = true
                    }
                }
            }
        }

        for i in 1..<row {
            if matrix[i][0] == 0 {
                for j in 1..<col {
                    matrix[i][j] = 0
                }
            }
        }

        for i in 1..<col {
            if matrix[0][i] == 0 {
                for j in 1..<row {
                    matrix[j][i] = 0
                }
            }
        }

        if isRow {
            for i in 1..<col {
                matrix[0][i] = 0
            }
        }

        if isCol {
            for i in 1..<row {
                matrix[i][0] = 0
            }
        }
    }
}
// @lc code=end

