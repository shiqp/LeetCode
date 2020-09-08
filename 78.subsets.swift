/*
 * @lc app=leetcode id=78 lang=swift
 *
 * [78] Subsets
 *
 * https://leetcode.com/problems/subsets/description/
 *
 * algorithms
 * Medium (60.06%)
 * Likes:    3620
 * Dislikes: 79
 * Total Accepted:    555.3K
 * Total Submissions: 920K
 * Testcase Example:  '[1,2,3]'
 *
 * Given a set of distinct integers, nums, return all possible subsets (the
 * power set).
 * 
 * Note: The solution set must not contain duplicate subsets.
 * 
 * Example:
 * 
 * 
 * Input: nums = [1,2,3]
 * Output:
 * [
 * ⁠ [3],
 * [1],
 * [2],
 * [1,2,3],
 * [1,3],
 * [2,3],
 * [1,2],
 * []
 * ]
 * 
 */

// @lc code=start
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var sets = [[Int]]()
        sets.append([])

        for num in nums {
            for set in sets {
                var set = set
                set.append(num)
                sets.append(set)
            }
        }

        return sets
    }
}
// @lc code=end

