/*
 * @lc app=leetcode id=63 lang=swift
 *
 * [63] Unique Paths II
 *
 * https://leetcode.com/problems/unique-paths-ii/description/
 *
 * algorithms
 * Medium (34.22%)
 * Likes:    1618
 * Dislikes: 234
 * Total Accepted:    287.1K
 * Total Submissions: 838.8K
 * Testcase Example:  '[[0,0,0],[0,1,0],[0,0,0]]'
 *
 * A robot is located at the top-left corner of a m x n grid (marked 'Start' in
 * the diagram below).
 * 
 * The robot can only move either down or right at any point in time. The robot
 * is trying to reach the bottom-right corner of the grid (marked 'Finish' in
 * the diagram below).
 * 
 * Now consider if some obstacles are added to the grids. How many unique paths
 * would there be?
 * 
 * 
 * 
 * An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 * 
 * Note: m and n will be at most 100.
 * 
 * Example 1:
 * 
 * 
 * Input:
 * [
 * [0,0,0],
 * [0,1,0],
 * [0,0,0]
 * ]
 * Output: 2
 * Explanation:
 * There is one obstacle in the middle of the 3x3 grid above.
 * There are two ways to reach the bottom-right corner:
 * 1. Right -> Right -> Down -> Down
 * 2. Down -> Down -> Right -> Right
 * 
 * 
 */

// @lc code=start
class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid.first!.count
        if obstacleGrid[m - 1][n - 1] == 1 {
            return 0
        }

        var counts = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        counts[m - 1][n - 1] = 1

        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                if (i == m - 1 && j == n - 1) || obstacleGrid[i][j] == 1 {
                    continue
                }
                
                if i == m - 1 {
                    counts[i][j] = counts[i][j + 1]
                } else if j == n - 1 {
                    counts[i][j] = counts[i + 1][j]
                } else {
                    counts[i][j] = counts[i][j + 1] + counts[i + 1][j]
                }
            }
        }

        return counts[0][0]
    }
}
// @lc code=end

