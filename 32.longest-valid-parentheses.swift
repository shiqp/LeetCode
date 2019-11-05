/*
 * @lc app=leetcode id=32 lang=swift
 *
 * [32] Longest Valid Parentheses
 */
class Solution32 {
    /*
     Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

     Example 1:

     Input: "(()"
     Output: 2
     Explanation: The longest valid parentheses substring is "()"
     Example 2:

     Input: ")()())"
     Output: 4
     Explanation: The longest valid parentheses substring is "()()"
     */
    func longestValidParentheses(_ s: String) -> Int {
        if s.count < 2 {
            return 0
        }

        // DP[i]：以s[i]为结尾的longest valid parentheses substring的长度
        var dp = [Int](repeating: 0, count: s.count)
        var length = 0

        let characters = Array(s)
        for i in 1..<s.count {
            let j = i - 1 - dp[i - 1]
            if j >= 0 && characters[j] == "(" && characters[i] == ")" {
                dp[i] = dp[i - 1] + 2
                if j > 0 {
                    dp[i] += dp[j - 1]
                }
                length = max(length, dp[i])
            }
        }

        return length
    }
}

