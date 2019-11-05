/*
 * @lc app=leetcode id=39 lang=swift
 *
 * [39] Combination Sum
 *
 * https://leetcode.com/problems/combination-sum/description/
 *
 * algorithms
 * Medium (51.56%)
 * Likes:    2615
 * Dislikes: 80
 * Total Accepted:    416.8K
 * Total Submissions: 808.1K
 * Testcase Example:  '[2,3,6,7]\n7'
 *
 * Given a set of candidate numbers (candidates) (without duplicates) and a
 * target number (target), find all unique combinations in candidates where the
 * candidate numbers sums to target.
 * 
 * The same repeated number may be chosen from candidates unlimited number of
 * times.
 * 
 * Note:
 * 
 * 
 * All numbers (including target) will be positive integers.
 * The solution set must not contain duplicate combinations.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: candidates = [2,3,6,7], target = 7,
 * A solution set is:
 * [
 * ⁠ [7],
 * ⁠ [2,2,3]
 * ]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: candidates = [2,3,5], target = 8,
 * A solution set is:
 * [
 * [2,2,2,2],
 * [2,3,3],
 * [3,5]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if let combinations = combinationSum(candidates, 0, target) {
            return combinations
        }

        return []
    }

    func combinationSum(_ candidates: [Int], _ i: Int, _ target: Int) -> [[Int]]? {
        if i >= candidates.count {
            return nil
        }

        var result = [[Int]]()
        var count = 0
        var currentTarget = target
        
        while currentTarget >= 0 {
            if currentTarget > 0 {
                if let combinations = combinationSum(candidates, i + 1, currentTarget) {
                    for combination in combinations {
                        var finalCombination = Array(repeating: candidates[i], count: count)
                        finalCombination.append(contentsOf: combination)
                        result.append(finalCombination)
                    }
                }
            } else {
                result.append(Array(repeating: candidates[i], count: count))
            }

            count += 1
            currentTarget -= candidates[i]
        }

        return result.isEmpty ? nil : result
    }
}
// @lc code=end

