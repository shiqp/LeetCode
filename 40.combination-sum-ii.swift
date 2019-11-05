/*
 * @lc app=leetcode id=40 lang=swift
 *
 * [40] Combination Sum II
 *
 * https://leetcode.com/problems/combination-sum-ii/description/
 *
 * algorithms
 * Medium (44.15%)
 * Likes:    1162
 * Dislikes: 51
 * Total Accepted:    261.5K
 * Total Submissions: 592.1K
 * Testcase Example:  '[10,1,2,7,6,1,5]\n8'
 *
 * Given a collection of candidate numbers (candidates) and a target number
 * (target), find all unique combinations in candidates where the candidate
 * numbers sums to target.
 * 
 * Each number in candidates may only be used once in the combination.
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
 * Input: candidates = [10,1,2,7,6,1,5], target = 8,
 * A solution set is:
 * [
 * ⁠ [1, 7],
 * ⁠ [1, 2, 5],
 * ⁠ [2, 6],
 * ⁠ [1, 1, 6]
 * ]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: candidates = [2,5,2,1,2], target = 5,
 * A solution set is:
 * [
 * [1,2,2],
 * [5]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if let combinations = combinationSum2(candidates.sorted(), 0, target) {
            return combinations
        }

        return []
    }

    func combinationSum2(_ candidates: [Int], _ i: Int, _ target: Int) -> [[Int]]? {
        if i >= candidates.count || target <= 0 {
            return nil
        }

        var result = [[Int]]()
        
        if target == candidates[i] {
            result.append([candidates[i]])
        }

        if let combinations = combinationSum2(candidates, i + 1, target - candidates[i]) {
            for combination in combinations {
                var finalCombination = [candidates[i]]
                finalCombination.append(contentsOf: combination)
                result.append(finalCombination)
            }
        }

        var j = i + 1
        while j < candidates.count && candidates[j] == candidates[i] {
            j += 1
        }
        
        if let combinations = combinationSum2(candidates, j, target) {
            for combination in combinations {
                result.append(combination)
            }
        }
        
        return result.isEmpty ? nil : result
    }
}
// @lc code=end

