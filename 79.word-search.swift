/*
 * @lc app=leetcode id=79 lang=swift
 *
 * [79] Word Search
 *
 * https://leetcode.com/problems/word-search/description/
 *
 * algorithms
 * Medium (34.59%)
 * Likes:    3687
 * Dislikes: 176
 * Total Accepted:    465.9K
 * Total Submissions: 1.3M
 * Testcase Example:  '[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"ABCCED"'
 *
 * Given a 2D board and a word, find if the word exists in the grid.
 * 
 * The word can be constructed from letters of sequentially adjacent cell,
 * where "adjacent" cells are those horizontally or vertically neighboring. The
 * same letter cell may not be used more than once.
 * 
 * Example:
 * 
 * 
 * board =
 * [
 * ⁠ ['A','B','C','E'],
 * ⁠ ['S','F','C','S'],
 * ⁠ ['A','D','E','E']
 * ]
 * 
 * Given word = "ABCCED", return true.
 * Given word = "SEE", return true.
 * Given word = "ABCB", return false.
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * board and word consists only of lowercase and uppercase English letters.
 * 1 <= board.length <= 200
 * 1 <= board[i].length <= 200
 * 1 <= word.length <= 10^3
 * 
 * 
 */

// @lc code=start
class Solution79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let row = board.count
        let col = board.first!.count
        var flag = [Bool](repeating: false, count: row * col)

        let letter = word.first!
        let k = word.index(after: word.startIndex)
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == letter {
                    flag[i * col + j] = true

                    // DP
                    if dp(board, &flag, row, col, i, j, word, k) {
                        return true
                    }

                    flag[i * col + j] = false
                }
            }
        }

        return false
    }

    func dp(_ board: [[Character]], _ flag: inout [Bool],
            _ row: Int, _ col: Int,
            _ i: Int, _ j: Int, 
            _ word: String, _ k: String.Index) -> Bool {
        if k == word.endIndex {
            return true
        }

        let letter = word[k]
        let nextLetterIndex = word.index(after: k)

        // Up Neighbor
        var m = (i - 1) * col + j
        if i - 1 >= 0 && !flag[m] && letter == board[i - 1][j] {
            flag[m] = true

            if dp(board, &flag, row, col, i - 1, j, word, nextLetterIndex) {
                return true
            }

            flag[m] = false
        }

        // Down Neighbor
        m = (i + 1) * col + j
        if i + 1 < row && !flag[m] && letter == board[i + 1][j] {
            flag[m] = true

            if dp(board, &flag, row, col, i + 1, j, word, nextLetterIndex) {
                return true
            }

            flag[m] = false
        }

        // Left Neighbor
        m = i * col + j - 1
        if j - 1 >= 0 && !flag[m] && letter == board[i][j - 1] {
            flag[m] = true

            if dp(board, &flag, row, col, i, j - 1, word, nextLetterIndex) {
                return true
            }

            flag[m] = false
        }

        // Right Neighbor
        m = i * col + j + 1
        if j + 1 < col && !flag[m] && letter == board[i][j + 1] {
            flag[m] = true

            if dp(board, &flag, row, col, i, j + 1, word, nextLetterIndex) {
                return true
            }

            flag[m] = false
        }

        return false
    }
}
// @lc code=end

