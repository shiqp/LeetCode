/*
 * @lc app=leetcode id=17 lang=swift
 *
 * [17] Letter Combinations of a Phone Number
 */
class Solution17 {
    let symbols = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return [String]()
        }

        let index = digits.index(after: digits.startIndex)
        var combinations = letterCombinations(String(digits[index...]))
        let symbol = symbols[Int(digits.first!.asciiValue!) - 48]

        if combinations.count == 0 {
            combinations.append("")
        }

        var result = [String]()
        for comb in combinations {
            for character in symbol {
                result.append("\(character)\(comb)")
            }
        }

        return result
    }
}

