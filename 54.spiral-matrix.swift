/*
 * @lc app=leetcode id=54 lang=swift
 *
 * [54] Spiral Matrix
 *
 * https://leetcode.com/problems/spiral-matrix/description/
 *
 * algorithms
 * Medium (31.90%)
 * Likes:    1505
 * Dislikes: 460
 * Total Accepted:    285.3K
 * Total Submissions: 893.1K
 * Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
 *
 * Given a matrix of m x n elements (m rows, n columns), return all elements of
 * the matrix in spiral order.
 * 
 * Example 1:
 * 
 * 
 * Input:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 4, 5, 6 ],
 * ⁠[ 7, 8, 9 ]
 * ]
 * Output: [1,2,3,6,9,8,7,4,5]
 * 
 * 
 * Example 2:
 * 
 * Input:
 * [
 * ⁠ [1, 2, 3, 4],
 * ⁠ [5, 6, 7, 8],
 * ⁠ [9,10,11,12]
 * ]
 * Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 * 
 */

// @lc code=start
class Solution54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var row = matrix.count
        if row == 0 {
            return []
        }

        var col = matrix.first!.count
        if col == 0 {
            return []
        }

        var i = 0, j = 0
        var result = [Int]()
        while row > 0 && col > 0 {
            var k = j
            while k < j + col {
                result.append(matrix[i][k])
                k += 1
            }

            k = i + 1
            while k < i + row {
                result.append(matrix[k][j + col - 1])
                k += 1
            }

            k = j + col - 2
            while k >= j && row > 1 {
                result.append(matrix[i + row - 1][k])
                k -= 1
            }

            k = i + row - 2
            while k > i && col > 1 {
                result.append(matrix[k][j])
                k -= 1
            }

            i += 1
            j += 1
            row -= 2
            col -= 2
        }

        return result
    }
}
// @lc code=end

