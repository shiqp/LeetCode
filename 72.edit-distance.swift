/*
 * @lc app=leetcode id=72 lang=swift
 *
 * [72] Edit Distance
 *
 * https://leetcode.com/problems/edit-distance/description/
 *
 * algorithms
 * Hard (44.07%)
 * Likes:    3807
 * Dislikes: 55
 * Total Accepted:    274.2K
 * Total Submissions: 622K
 * Testcase Example:  '"horse"\n"ros"'
 *
 * Given two words word1 and word2, find the minimum number of operations
 * required to convert word1 to word2.
 * 
 * You have the following 3 operations permitted on a word:
 * 
 * 
 * Insert a character
 * Delete a character
 * Replace a character
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: word1 = "horse", word2 = "ros"
 * Output: 3
 * Explanation: 
 * horse -> rorse (replace 'h' with 'r')
 * rorse -> rose (remove 'r')
 * rose -> ros (remove 'e')
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: word1 = "intention", word2 = "execution"
 * Output: 5
 * Explanation: 
 * intention -> inention (remove 't')
 * inention -> enention (replace 'i' with 'e')
 * enention -> exention (replace 'n' with 'x')
 * exention -> exection (replace 'n' with 'c')
 * exection -> execution (insert 'u')
 * 
 * 
 */

// @lc code=start
class Solution72 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: word1.count + 1), count: word2.count + 1)

        for i in 0...word1.count {
            dp[0][i] = i
        }

        for i in 0...word2.count {
            dp[i][0] = i
        }

        var i = 1
        for character2 in word2 {
            var j = 1
            for character1 in word1 {
                if character1 == character2 {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i][j - 1], dp[i - 1][j])) + 1
                }

                j += 1
            }

            i += 1
        }

        return dp[word2.count][word1.count]
    }
}
// @lc code=end

