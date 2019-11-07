/*
 * @lc app=leetcode id=48 lang=swift
 *
 * [48] Rotate Image
 */

// @lc code=start
class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        var length = matrix.count
        var i = 0
        while length > 1 {
            for j in 0..<length - 1 {
                let temp = matrix[i][i + j]
                matrix[i][i + j] = matrix[i + length - 1 - j][i]
                matrix[i + length - 1 - j][i] = matrix[i + length - 1][i + length - 1 - j]
                matrix[i + length - 1][i + length - 1 - j] = matrix[i + j][i + length - 1]
                matrix[i + j][i + length - 1] = temp
            }
            i += 1
            length -= 2
        }
    }
}
// @lc code=end

