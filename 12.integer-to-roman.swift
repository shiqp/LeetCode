/*
 * @lc app=leetcode id=12 lang=swift
 *
 * [12] Integer to Roman
 */
class Solution {
    func intToRoman(_ num: Int) -> String {
        let radix = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbol = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

        var roman = String()
        var num = num
        var i = 0
        while num > 0 {
            var count = num / radix[i]
            num %= radix[i]
            while count > 0 {
                roman.append(symbol[i])
                count -= 1
            }

            i += 1
        }

        return roman
    }
}

