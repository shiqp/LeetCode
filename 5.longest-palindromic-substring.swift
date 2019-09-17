/*
 * @lc app=leetcode id=5 lang=swift
 *
 * [5] Longest Palindromic Substring
 */
extension Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }

        let characters = Array(s)

        var start = 0, end = 0
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        for i in 1...s.count {
            for j in 0..<s.count + 1 - i {
                let k = j + i - 1
                dp[j][k] = characters[j] == characters[k] && (i <= 3 || dp[j + 1][k - 1])
                if dp[j][k] && k - j > end - start {
                    start = j
                    end = k
                }
            }
        }

        return String(characters[start...end])
    }
}

