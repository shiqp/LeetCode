/*
 * @lc app=leetcode id=6 lang=swift
 *
 * [6] ZigZag Conversion
 */
class Solution6 {
    /*
     The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

     P   A   H   N
     A P L S I I G
     Y   I   R
     And then read line by line: "PAHNAPLSIIGYIR"

     Write the code that will take a string and make this conversion given a number of rows:

     string convert(string s, int numRows);
     Example 1:

     Input: s = "PAYPALISHIRING", numRows = 3
     Output: "PAHNAPLSIIGYIR"
     Example 2:

     Input: s = "PAYPALISHIRING", numRows = 4
     Output: "PINALSIGYAHRPI"
     Explanation:

     P     I    N
     A   L S  I G
     Y A   H R
     P     I
    */
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 1 {
            return s
        }

        let characters = Array(s)
        let offset = (numRows - 1) * 2

        var result = String()
        for i in 0..<numRows {
            for j in stride(from: i, to: s.count, by: offset) {
                result.append(characters[j])
                let k = j + offset - 2 * i
                if i != 0 && i != numRows - 1 && k < s.count {
                    result.append(characters[k])
                }
            }
        }

        return result
    }
}

