/*
 * @lc app=leetcode id=76 lang=swift
 *
 * [76] Minimum Window Substring
 *
 * https://leetcode.com/problems/minimum-window-substring/description/
 *
 * algorithms
 * Hard (34.26%)
 * Likes:    4340
 * Dislikes: 302
 * Total Accepted:    389.8K
 * Total Submissions: 1.1M
 * Testcase Example:  '"ADOBECODEBANC"\n"ABC"'
 *
 * Given a string S and a string T, find the minimum window in S which will
 * contain all the characters in T in complexity O(n).
 * 
 * Example:
 * 
 * 
 * Input: S = "ADOBECODEBANC", T = "ABC"
 * Output: "BANC"
 * 
 * 
 * Note:
 * 
 * 
 * If there is no such window in S that covers all characters in T, return the
 * empty string "".
 * If there is such window, you are guaranteed that there will always be only
 * one unique minimum window in S.
 * 
 * 
 */

// @lc code=start
class Solution76 {
    func minWindow(_ s: String, _ t: String) -> String {
        var map = [Character: Int]()
        for char in t {
            map[char, default: 0] += 1
        }

        var minLeft = 0
        var minLength = s.count + 1

        let chars = Array(s)
        var left = 0
        var right = 0
        let tCount = t.count
        var count = 0

        while right < chars.count {
            if let charCount = map[chars[right]] {
                if charCount > 0 {
                    count += 1
                }
                map[chars[right]] = charCount - 1
            }

            while count == tCount {
                if right - left + 1 < minLength {
                    minLength = right - left + 1
                    minLeft = left
                }

                if let charCount = map[chars[left]] {
                    map[chars[left]] = charCount + 1
                    if charCount >= 0 {
                        count -= 1
                    }
                }

                left += 1
            }

            right += 1
        }

        if minLength == s.count + 1 {
            return ""
        }

        return String(chars[minLeft..<minLeft + minLength])
    }
}
// @lc code=end

