/*
 * @lc app=leetcode id=30 lang=swift
 *
 * [30] Substring with Concatenation of All Words
 */
class Solution30 {
    /*
     You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.

     Example 1:

     Input:
     s = "barfoothefoobarman",
     words = ["foo","bar"]
     Output: [0,9]
     Explanation: Substrings starting at index 0 and 9 are "barfoor" and "foobar" respectively.
     The output order does not matter, returning [9,0] is fine too.
     Example 2:

     Input:
     s = "wordgoodgoodgoodbestword",
     words = ["word","good","best","word"]
     Output: []
     */
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if s.count == 0 || words.count == 0 {
            return []
        }

        let wordLength = words.first!.count
        let subStringLength = wordLength * words.count
        if subStringLength > s.count {
            return []
        }

        var map = [String: Int]()
        for word in words {
            if let count = map[word] {
                map[word] = count + 1
            } else {
                map[word] = 1
            }
        }

        var result = [Int]()
        var index = s.startIndex
        var endIndex = s.index(index, offsetBy: subStringLength)
        while true {
            let subString = s[index..<endIndex]
            var subMap = map

            var j = subString.startIndex
            var k = subString.index(j, offsetBy: wordLength)
            while true {
                let subWord = String(subString[j..<k])
                if let count = subMap[subWord], count > 0 {
                    subMap[subWord] = count - 1
                } else {
                    break
                }

                if k == subString.endIndex {
                    result.append(s.distance(from: s.startIndex, to: index))
                    break
                }

                j = subString.index(j, offsetBy: wordLength)
                k = subString.index(k, offsetBy: wordLength)
            }

            if endIndex == s.endIndex {
                break
            }

            index = s.index(after: index)
            endIndex = s.index(after: endIndex)
        }

        return result
    }
}

