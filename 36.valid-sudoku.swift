/*
 * @lc app=leetcode id=36 lang=swift
 *
 * [36] Valid Sudoku
 */

// @lc code=start
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let map = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    continue
                }

                if board[i][j] == "1" {

                }
            }
        }
    }
}
// @lc code=end

