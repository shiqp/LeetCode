/*
 * @lc app=leetcode id=46 lang=swift
 *
 * [46] Permutations
 *
 * https://leetcode.com/problems/permutations/description/
 *
 * algorithms
 * Medium (58.32%)
 * Likes:    2622
 * Dislikes: 84
 * Total Accepted:    461.2K
 * Total Submissions: 790.3K
 * Testcase Example:  '[1,2,3]'
 *
 * Given a collection of distinct integers, return all possible permutations.
 * 
 * Example:
 * 
 * 
 * Input: [1,2,3]
 * Output:
 * [
 * ⁠ [1,2,3],
 * ⁠ [1,3,2],
 * ⁠ [2,1,3],
 * ⁠ [2,3,1],
 * ⁠ [3,1,2],
 * ⁠ [3,2,1]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        var result = [[Int]]()
        for num in nums {
            if result.isEmpty {
                result.append([num])
                continue
            }

            var count = result.count
            while count != 0 {
                var head = [num]
                head.append(contentsOf: result.removeFirst())
                result.append(head.map { $0 })
                for i in 0..<head.count - 1 {
                    head.swapAt(i, i + 1)
                    result.append(head.map { $0 })
                }
                count -= 1
            }
        }
        return result
    }
}
// @lc code=end

