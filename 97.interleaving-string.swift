/*
 * @lc app=leetcode id=97 lang=swift
 *
 * [97] Interleaving String
 *
 * https://leetcode.com/problems/interleaving-string/description/
 *
 * algorithms
 * Hard (31.02%)
 * Likes:    1615
 * Dislikes: 95
 * Total Accepted:    162.3K
 * Total Submissions: 510.2K
 * Testcase Example:  '"aabcc"\n"dbbca"\n"aadbbcbcac"'
 *
 * Given s1, s2, and s3, find whether s3 is formed by the interleaving of s1
 * and s2.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 * Output: false
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: s1 = "", s2 = "", s3 = ""
 * Output: true
 * 
 * 
 * 
 * Constraints:
 * 
 * 
 * 0 <= s1.length, s2.length <= 100
 * 0 <= s3.length <= 200
 * s1, s2, and s3 consist of lower-case English letters.
 * 
 * 
 */

// @lc code=start
class Solution97 {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }

        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s2.count + 1), count: s1.count + 1)
        for i in 0...s1.count {
            for j in 0...s2.count {
                if i == 0 && j == 0 {
                    dp[i][j] = true
                } else if i == 0 {
                    dp[i][j] = s2.prefix(j) == s3.prefix(j)
                } else if j == 0 {
                    dp[i][j] = s1.prefix(i) == s3.prefix(i)
                } else {
                    let ii = s1.index(s1.startIndex, offsetBy: i - 1)
                    let jj = s2.index(s2.startIndex, offsetBy: j - 1)
                    let kk = s3.index(s3.startIndex, offsetBy: i + j - 1)
                    dp[i][j] = (s1[ii] == s3[kk] && dp[i - 1][j]) || (s2[jj] == s3[kk] && dp[i][j - 1])
                }
            }
        }

        return dp[s1.count][s2.count]
    }
}
// @lc code=end

