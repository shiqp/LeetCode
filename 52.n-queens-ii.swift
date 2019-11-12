/*
 * @lc app=leetcode id=52 lang=swift
 *
 * [52] N-Queens II
 *
 * https://leetcode.com/problems/n-queens-ii/description/
 *
 * algorithms
 * Hard (54.33%)
 * Likes:    346
 * Dislikes: 129
 * Total Accepted:    113.3K
 * Total Submissions: 208.2K
 * Testcase Example:  '4'
 *
 * The n-queens puzzle is the problem of placing n queens on an n×n chessboard
 * such that no two queens attack each other.
 * 
 * 
 * 
 * Given an integer n, return the number of distinct solutions to the n-queens
 * puzzle.
 * 
 * Example:
 * 
 * 
 * Input: 4
 * Output: 2
 * Explanation: There are two distinct solutions to the 4-queens puzzle as
 * shown below.
 * [
 * [".Q..",  // Solution 1
 * "...Q",
 * "Q...",
 * "..Q."],
 * 
 * ["..Q.",  // Solution 2
 * "Q...",
 * "...Q",
 * ".Q.."]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution52 {
    func totalNQueens(_ n: Int) -> Int {
        var queens = [Int](repeating: -1, count: n)
        return totalNQueens(n, 0, &queens)
    }

    func totalNQueens(_ n: Int, _ line: Int, _ queens: inout [Int]) -> Int {
        if line == n {
            return 1
        }

        var count = 0
        for i in 0..<n {
            if check(line, i, queens) {
                queens[line] = i
                count += totalNQueens(n, line + 1, &queens)
            }
        }

        return count
    }

    func check(_ line: Int, _ position: Int, _ queens: [Int]) -> Bool {
        if line == 0 {
            return true
        }

        for i in 0..<line {
            if queens[i] == position || line - i == abs(queens[i] - position) {
                return false
            }
        }

        return true
    }
}
// @lc code=end

