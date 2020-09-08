/*
 * @lc app=leetcode id=77 lang=swift
 *
 * [77] Combinations
 *
 * https://leetcode.com/problems/combinations/description/
 *
 * algorithms
 * Medium (53.79%)
 * Likes:    1433
 * Dislikes: 66
 * Total Accepted:    286.9K
 * Total Submissions: 530.7K
 * Testcase Example:  '4\n2'
 *
 * Given two integers n and k, return all possible combinations of k numbers
 * out of 1 ... n.
 * 
 * Example:
 * 
 * 
 * Input: n = 4, k = 2
 * Output:
 * [
 * ⁠ [2,4],
 * ⁠ [3,4],
 * ⁠ [2,3],
 * ⁠ [1,2],
 * ⁠ [1,3],
 * ⁠ [1,4],
 * ]
 * 
 * 
 */

// @lc code=start
class Solution77 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < 1 || k > n {
            return [[Int]]()
        }

        return dp(start: 1, end: n, count: k)
    }

    func dp(start: Int, end: Int, count: Int) -> [[Int]] {
        if count <= 0 {
            return [[Int]]()
        }

        var result = [[Int]]()
        for i in start...end - count + 1 {
            let subResult = dp(start: i + 1, end: end, count: count - 1)
            if subResult.count == 0 {
                result.append([i]);
            } else {
                for combine in subResult {
                    var combine = combine
                    combine.append(i)
                    result.append(combine)
                }
            }
        }

        return result
    }
}
// @lc code=end

