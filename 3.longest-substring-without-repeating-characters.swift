/*
 * @lc app=leetcode id=3 lang=swift
 *
 * [3] Longest Substring Without Repeating Characters
 */
extension Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int]()
        var start = 0, i = 0, maxLength = 0
        for element in s {
            if let value = map[element] {
                if value >= start {
                    start = value + 1   
                }
            }

            map[element] = i
            let length = i - start + 1
            if length > maxLength {
                maxLength = length
            }

            i += 1
        }

        return maxLength
    }
}

