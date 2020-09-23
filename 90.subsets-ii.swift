/*
 * @lc app=leetcode id=90 lang=swift
 *
 * [90] Subsets II
 *
 * https://leetcode.com/problems/subsets-ii/description/
 *
 * algorithms
 * Medium (46.40%)
 * Likes:    1857
 * Dislikes: 83
 * Total Accepted:    295.9K
 * Total Submissions: 622.7K
 * Testcase Example:  '[1,2,2]'
 *
 * Given a collection of integers that might contain duplicates, nums, return
 * all possible subsets (the power set).
 * 
 * Note: The solution set must not contain duplicate subsets.
 * 
 * Example:
 * 
 * 
 * Input: [1,2,2]
 * Output:
 * [
 * ⁠ [2],
 * ⁠ [1],
 * ⁠ [1,2,2],
 * ⁠ [2,2],
 * ⁠ [1,2],
 * ⁠ []
 * ]
 * 
 * 
 */

// @lc code=start
class Solution90 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()

        var subsets = [[Int]]()
        subsets.append([])

        var preSubsets = [[Int]]()
        var preNum: Int?
        for num in nums {
            var newSubsets = [[Int]]()
            let curSubsets = (preNum != nil && num == preNum!) ? preSubsets : subsets
            for subset in curSubsets {
                var subset = subset
                subset.append(num)
                newSubsets.append(subset)
            }

            subsets.append(contentsOf: newSubsets)

            preNum = num
            preSubsets = newSubsets
        }

        return subsets
    }
}
// @lc code=end

