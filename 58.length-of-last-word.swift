/*
 * @lc app=leetcode id=58 lang=swift
 *
 * [58] Length of Last Word
 */
class Solution58 {
    /// Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
    ///
    /// - Parameter s: The string s consists of upper/lower-case alphabets and empty space characters ' '.
    /// - Returns: The length of last word in the string.
    func lengthOfLastWord(_ s: String) -> Int {
        let substrings = s.split(separator: " ")
        if let lastWord = substrings.last {
            return lastWord.count
        }

        return 0
    }
}

