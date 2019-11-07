/*
 * @lc app=leetcode id=47 lang=swift
 *
 * [47] Permutations II
 *
 * https://leetcode.com/problems/permutations-ii/description/
 *
 * algorithms
 * Medium (42.86%)
 * Likes:    1345
 * Dislikes: 47
 * Total Accepted:    285.9K
 * Total Submissions: 666.4K
 * Testcase Example:  '[1,1,2]'
 *
 * Given a collection of numbers that might contain duplicates, return all
 * possible unique permutations.
 * 
 * Example:
 * 
 * 
 * Input: [1,1,2]
 * Output:
 * [
 * ⁠ [1,1,2],
 * ⁠ [1,2,1],
 * ⁠ [2,1,1]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        var result = [[Int]]()
        permute(nums.sorted(), nums.startIndex, &result)
        return result
    }

    func permute(_ nums: [Int], _ start: Int, _ result: inout [[Int]]) {
        if start == nums.endIndex {
            result.append(nums)
            return
        }

        var nums = nums
        for i in start..<nums.endIndex {
            if i == start || nums[i] != nums[start] {
                nums.swapAt(i, start)
                permute(nums, start + 1, &result)
            }
        }
    }
}
// @lc code=end

