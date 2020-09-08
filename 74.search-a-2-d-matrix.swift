/*
 * @lc app=leetcode id=74 lang=swift
 *
 * [74] Search a 2D Matrix
 *
 * https://leetcode.com/problems/search-a-2d-matrix/description/
 *
 * algorithms
 * Medium (36.31%)
 * Likes:    1697
 * Dislikes: 156
 * Total Accepted:    319.4K
 * Total Submissions: 879.4K
 * Testcase Example:  '[[1,3,5,7],[10,11,16,20],[23,30,34,50]]\n3'
 *
 * Write an efficient algorithm that searches for a value in an m x n matrix.
 * This matrix has the following properties:
 * 
 * 
 * Integers in each row are sorted from left to right.
 * The first integer of each row is greater than the last integer of the
 * previous row.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 3
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 13
 * Output: false
 * 
 */

// @lc code=start
class Solution74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }

        if matrix.first!.count == 0 {
            return false
        }

        var rowLow = 0
        var rowHigh = matrix.count - 1
        while rowLow <= rowHigh {
            let rowMid = (rowLow + rowHigh) / 2
            if matrix[rowMid].first! > target {
                rowHigh = rowMid - 1
            } else if matrix[rowMid].last! < target {
                rowLow = rowMid + 1
            } else {
                var colLow = 0
                var colHigh = matrix[rowMid].count - 1
                while colLow <= colHigh {
                    let colMid = (colLow + colHigh) / 2
                    if matrix[rowMid][colMid] > target {
                        colHigh = colMid - 1
                    } else if matrix[rowMid][colMid] < target {
                        colLow = colMid + 1
                    } else {
                        return true
                    }
                }

                return false
            }
        }

        return false
    }
}
// @lc code=end

