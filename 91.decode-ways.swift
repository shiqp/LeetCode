/*
 * @lc app=leetcode id=91 lang=swift
 *
 * [91] Decode Ways
 *
 * https://leetcode.com/problems/decode-ways/description/
 *
 * algorithms
 * Medium (24.29%)
 * Likes:    3079
 * Dislikes: 3106
 * Total Accepted:    438K
 * Total Submissions: 1.8M
 * Testcase Example:  '"12"'
 *
 * A message containing letters from A-Z is being encoded to numbers using the
 * following mapping:
 * 
 * 
 * 'A' -> 1
 * 'B' -> 2
 * ...
 * 'Z' -> 26
 * 
 * 
 * Given a non-empty string containing only digits, determine the total number
 * of ways to decode it.
 * 
 * Example 1:
 * 
 * 
 * Input: "12"
 * Output: 2
 * Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "226"
 * Output: 3
 * Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2
 * 6).
 * 
 */

// @lc code=start
class Solution91 {
    func numDecodings(_ s: String) -> Int {
        if s.first! == "0" {
            return 0
        }

        if s.count == 1 {
            return 1
        }

        var i = s.startIndex
        var j = s.index(after: i)
        if s[i] >= "3" && s[j] == "0"  {
            return 0
        }

        var dp = [Int](repeating: 1, count: s.count)
        if s[i...j] == "10" || s[i...j] == "20" || s[i...j] > "26" {
            dp[1] = 1
        } else {
            dp[1] = 2
        }

        var ii = 0
        var jj = 1
        var kk = 2
        var k = s.index(after: j)
        while k != s.endIndex {
            if s[k] == "0" && (s[j] == "0" || s[j] >= "3") {
                return 0
            }

            let substring = s[j...k]
            if substring == "10" || substring == "20" {
                dp[kk] = dp[ii]
            } else if substring > "26" || s[j] == "0" {
                dp[kk] = dp[jj]
            } else {
                dp[kk] = dp[ii] + dp[jj]
            }

            i = j
            j = k
            k = s.index(after: k)

            ii += 1
            jj += 1
            kk += 1
        }

        return dp.last!
    }
}
// @lc code=end

