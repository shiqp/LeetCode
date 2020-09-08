/*
 * @lc app=leetcode id=60 lang=swift
 *
 * [60] Permutation Sequence
 *
 * https://leetcode.com/problems/permutation-sequence/description/
 *
 * algorithms
 * Medium (36.10%)
 * Likes:    1388
 * Dislikes: 313
 * Total Accepted:    176.4K
 * Total Submissions: 488.6K
 * Testcase Example:  '3\n3'
 *
 * The set [1,2,3,...,n] contains a total of n! unique permutations.
 * 
 * By listing and labeling all of the permutations in order, we get the
 * following sequence for n = 3:
 * 
 * 
 * "123"
 * "132"
 * "213"
 * "231"
 * "312"
 * "321"
 * 
 * 
 * Given n and k, return the k^th permutation sequence.
 * 
 * Note:
 * 
 * 
 * Given n will be between 1 and 9 inclusive.
 * Given k will be between 1 and n! inclusive.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: n = 3, k = 3
 * Output: "213"
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: n = 4, k = 9
 * Output: "2314"
 * 
 * 
 */

// @lc code=start
class Solution60 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var count = [Int](repeating: 1, count: 9)
        for i in 1..<9 {
            count[i] = count[i - 1] * i
        }

        var result = ""
        var k = k - 1
        for i in (1...n).reversed() {
            let j = k / count[i - 1]
            k = k % count[i - 1]
            result += "\(nums[j])"
            nums.remove(at: j)
        }

        return result
    }
}
// @lc code=end

