/*
 * @lc app=leetcode id=44 lang=swift
 *
 * [44] Wildcard Matching
 *
 * https://leetcode.com/problems/wildcard-matching/description/
 *
 * algorithms
 * Hard (23.59%)
 * Likes:    1389
 * Dislikes: 82
 * Total Accepted:    203.5K
 * Total Submissions: 862.6K
 * Testcase Example:  '"aa"\n"a"'
 *
 * Given an input string (s) and a pattern (p), implement wildcard pattern
 * matching with support for '?' and '*'.
 * 
 * 
 * '?' Matches any single character.
 * '*' Matches any sequence of characters (including the empty sequence).
 * 
 * 
 * The matching should cover the entire input string (not partial).
 * 
 * Note:
 * 
 * 
 * s could be empty and contains only lowercase letters a-z.
 * p could be empty and contains only lowercase letters a-z, and characters
 * like ? or *.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input:
 * s = "aa"
 * p = "a"
 * Output: false
 * Explanation: "a" does not match the entire string "aa".
 * 
 * 
 * Example 2:
 * 
 * 
 * Input:
 * s = "aa"
 * p = "*"
 * Output: true
 * Explanation: '*' matches any sequence.
 * 
 * 
 * Example 3:
 * 
 * 
 * Input:
 * s = "cb"
 * p = "?a"
 * Output: false
 * Explanation: '?' matches 'c', but the second letter is 'a', which does not
 * match 'b'.
 * 
 * 
 * Example 4:
 * 
 * 
 * Input:
 * s = "adceb"
 * p = "*a*b"
 * Output: true
 * Explanation: The first '*' matches the empty sequence, while the second '*'
 * matches the substring "dce".
 * 
 * 
 * Example 5:
 * 
 * 
 * Input:
 * s = "acdcb"
 * p = "a*c?b"
 * Output: false
 * 
 * 
 */

// @lc code=start
class Solution44 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if s.isEmpty && p.isEmpty {
            return true
        } else if p.isEmpty {
            return false
        } else if s.isEmpty {
            for character in p {
                if character != "*" {
                    return false
                }
            }

            return true
        }

        var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true

        var kk = p.startIndex
        for k in 1...p.count {
            if p[kk] == "*" {
                dp[0][k] = dp[0][k - 1]
            } else {
                break
            }

            kk = p.index(after: kk)
        }

        var ii = s.startIndex
        for i in 1...s.count {
            var jj = p.startIndex
            for j in 1...p.count {
                if p[jj] == "?" || p[jj] == s[ii] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else if p[jj] == "*" {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                }

                jj = p.index(after: jj)
            }

            ii = s.index(after: ii)
        }

        return dp[s.count][p.count]
    }
}
// @lc code=end

