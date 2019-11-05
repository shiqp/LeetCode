/*
 * @lc app=leetcode id=13 lang=swift
 *
 * [13] Roman to Integer
 */
class Solution13 {
    func romanToInt(_ s: String) -> Int {
        let map: [Character: Int] = [
            "M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1
        ]

        var result = map[s.first!]!
        var i = s.index(after: s.startIndex)
        while i != s.endIndex {
            let j = s.index(before: i)
            if map[s[j]]! < map[s[i]]! {
                result += map[s[i]]! - 2 * map[s[j]]!
            } else {
                result += map[s[i]]!
            }

            i = s.index(after: i)
        }
        return result
    }
}

