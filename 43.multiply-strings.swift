/*
 * @lc app=leetcode id=43 lang=swift
 *
 * [43] Multiply Strings
 *
 * https://leetcode.com/problems/multiply-strings/description/
 *
 * algorithms
 * Medium (31.92%)
 * Likes:    1273
 * Dislikes: 586
 * Total Accepted:    236.2K
 * Total Submissions: 740K
 * Testcase Example:  '"2"\n"3"'
 *
 * Given two non-negative integers num1 and num2 represented as strings, return
 * the product of num1 and num2, also represented as a string.
 * 
 * Example 1:
 * 
 * 
 * Input: num1 = "2", num2 = "3"
 * Output: "6"
 * 
 * Example 2:
 * 
 * 
 * Input: num1 = "123", num2 = "456"
 * Output: "56088"
 * 
 * 
 * Note:
 * 
 * 
 * The length of both num1 and num2 is < 110.
 * Both num1 and num2 contain only digits 0-9.
 * Both num1 and num2 do not contain any leading zero, except the number 0
 * itself.
 * You must not use any built-in BigInteger library or convert the inputs to
 * integer directly.
 * 
 * 
 */

// @lc code=start
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }

        var product = "0"
        var bit = 0
        for char1 in num1.reversed() {
            var temp = ""
            for _ in 0..<bit {
                temp += "0"
            }
            bit += 1

            var offset: UInt8 = 0
            for char2 in num2.reversed() {
                offset = numberValue(char1) * numberValue(char2) + offset
                temp = String(format: "%d", arguments: [offset % 10]) + temp
                offset = offset / 10
            }

            if offset != 0 {
                temp = String(format: "%d", arguments: [offset]) + temp
            }
            product = add(product, temp)
        }

        return product
    }

    func add(_ num1: String, _ num2: String) -> String {
        var num1 = num1
        var num2 = num2
        if num1.count > num2.count {
            swap(&num1, &num2)
        }

        var sum = ""
        var i = num1.index(before: num1.endIndex)
        var j = num2.index(before: num2.endIndex)
        var offset: UInt8 = 0
        while true {
            offset = numberValue(num1[i]) + numberValue(num2[j]) + offset
            sum = String(format: "%d", arguments: [offset % 10]) + sum
            offset = offset / 10

            if i == num1.startIndex {
                break
            }

            i = num1.index(before: i)
            j = num2.index(before: j)
        }

        if j == num2.startIndex {
            return offset == 0 ? sum : String(format: "%d", arguments: [offset]) + sum
        } else {
            j = num2.index(before: j)
        }

        while true {
            offset = numberValue(num2[j]) + offset
            sum = String(format: "%d", arguments: [offset % 10]) + sum
            offset = offset / 10

            if j == num2.startIndex {
                break
            }

            j = num2.index(before: j)
        }

        return offset == 0 ? sum : String(format: "%d", arguments: [offset]) + sum
    }
    
    func numberValue(_ character: Character) -> UInt8 {
        return character.asciiValue! - 48
    }
}
// @lc code=end

