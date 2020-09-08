/*
 * @lc app=leetcode id=64 lang=swift
 *
 * [64] Minimum Path Sum
 *
 * https://leetcode.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (53.75%)
 * Likes:    2879
 * Dislikes: 59
 * Total Accepted:    410.7K
 * Total Submissions: 764.2K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * Given a m x n grid filled with non-negative numbers, find a path from top
 * left to bottom right which minimizes the sum of all numbers along its path.
 * 
 * Note: You can only move either down or right at any point in time.
 * 
 * Example:
 * 
 * 
 * Input:
 * [
 *  [1,3,1],
 * ⁠ [1,5,1],
 * ⁠ [4,2,1]
 * ]
 * Output: 7
 * Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 * 
 * 
 */

// @lc code=start
class Solution64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid.first!.count
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                if i == m - 1 && j == n - 1 {
                    continue
                }

                if i == m - 1 {
                    grid[i][j] += grid[i][j + 1]
                } else if j == n - 1 {
                    grid[i][j] += grid[i + 1][j]
                } else {
                    grid[i][j] = min(grid[i][j] + grid[i][j + 1], grid[i][j] + grid[i + 1][j])
                }
            }
        }

        return grid[0][0]
    }
}
// @lc code=end

