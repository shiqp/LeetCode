/*
 * @lc app=leetcode id=10 lang=swift
 *
 * [10] Regular Expression Matching
 */
extension Solution {
    /*
     Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.

     '.' Matches any single character.
     '*' Matches zero or more of the preceding element.
     The matching should cover the entire input string (not partial).

     Note:

     s could be empty and contains only lowercase letters a-z.
     p could be empty and contains only lowercase letters a-z, and characters like . or *.
     */
    func isMatch(_ s: String, _ p: String) -> Bool {
        return isMatch(Array(s), Array(p))
    }

    func isMatch(_ s: [Character], _ p: [Character]) -> Bool {
        if p.isEmpty {
            return s.isEmpty
        }

        let firstMatch = !s.isEmpty && (s[0] == p[0] || p[0] == ".")
        if p.count >= 2 && p[1] == "*" {
            //两种情况
            //pattern 直接跳过两个字符。表示 * 前边的字符出现 0 次
            //pattern 不变，例如 text = aa ，pattern = a*，第一个 a 匹配，然后 text 的第二个 a 接着和 pattern 的第一个 a 进行匹配。表示 * 用前一个字符替代。
            return isMatch(s, Array(p[2..<p.endIndex])) || (firstMatch && isMatch(Array(s[1..<s.endIndex]), p))
        } else {
            return firstMatch && isMatch(Array(s[1..<s.endIndex]), Array(p[1..<p.endIndex]))
        }
    }
}

