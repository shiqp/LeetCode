/*
 * @lc app=leetcode id=51 lang=swift
 *
 * [51] N-Queens
 *
 * https://leetcode.com/problems/n-queens/description/
 *
 * algorithms
 * Hard (42.16%)
 * Likes:    1259
 * Dislikes: 58
 * Total Accepted:    166.2K
 * Total Submissions: 393.2K
 * Testcase Example:  '4'
 *
 * The n-queens puzzle is the problem of placing n queens on an n×n chessboard
 * such that no two queens attack each other.
 * 
 * 
 * 
 * Given an integer n, return all distinct solutions to the n-queens puzzle.
 * 
 * Each solution contains a distinct board configuration of the n-queens'
 * placement, where 'Q' and '.' both indicate a queen and an empty space
 * respectively.
 * 
 * Example:
 * 
 * 
 * Input: 4
 * Output: [
 * ⁠[".Q..",  // Solution 1
 * ⁠ "...Q",
 * ⁠ "Q...",
 * ⁠ "..Q."],
 * 
 * ⁠["..Q.",  // Solution 2
 * ⁠ "Q...",
 * ⁠ "...Q",
 * ⁠ ".Q.."]
 * ]
 * Explanation: There exist two distinct solutions to the 4-queens puzzle as
 * shown above.
 * 
 * 
 */

// @lc code=start
class Solution51 {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var queens = [Int](repeating: -1, count: n)
        solveNQueens(n, 0, &queens, &result)
        return result
    }

    func solveNQueens(_ n: Int, _ line: Int, _ queens: inout [Int], _ result: inout [[String]]) {
        if line == n {
            var chess = [String]()
            var lineLayout = [Character](repeating: ".", count: n)
            for i in queens {
                lineLayout[i] = "Q"
                chess.append(String(lineLayout))
                lineLayout[i] = "."
            }
            result.append(chess)
            return
        }

        for i in 0..<n {
            if check(line, i, queens) {
                queens[line] = i
                solveNQueens(n, line + 1, &queens, &result)
            }
        }
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

