/*
 * @lc app=leetcode id=68 lang=swift
 *
 * [68] Text Justification
 *
 * https://leetcode.com/problems/text-justification/description/
 *
 * algorithms
 * Hard (27.23%)
 * Likes:    654
 * Dislikes: 1543
 * Total Accepted:    133.9K
 * Total Submissions: 491.8K
 * Testcase Example:  '["This", "is", "an", "example", "of", "text", "justification."]\n16'
 *
 * Given an array of words and a width maxWidth, format the text such that each
 * line has exactly maxWidth characters and is fully (left and right)
 * justified.
 * 
 * You should pack your words in a greedy approach; that is, pack as many words
 * as you can in each line. Pad extra spaces ' ' when necessary so that each
 * line has exactly maxWidth characters.
 * 
 * Extra spaces between words should be distributed as evenly as possible. If
 * the number of spaces on a line do not divide evenly between words, the empty
 * slots on the left will be assigned more spaces than the slots on the right.
 * 
 * For the last line of text, it should be left justified and no extra space is
 * inserted between words.
 * 
 * Note:
 * 
 * 
 * A word is defined as a character sequence consisting of non-space characters
 * only.
 * Each word's length is guaranteed to be greater than 0 and not exceed
 * maxWidth.
 * The input array words contains at least one word.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input:
 * words = ["This", "is", "an", "example", "of", "text", "justification."]
 * maxWidth = 16
 * Output:
 * [
 * "This    is    an",
 * "example  of text",
 * "justification.  "
 * ]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input:
 * words = ["What","must","be","acknowledgment","shall","be"]
 * maxWidth = 16
 * Output:
 * [
 * "What   must   be",
 * "acknowledgment  ",
 * "shall be        "
 * ]
 * Explanation: Note that the last line is "shall be    " instead of "shall
 * be",
 * because the last line must be left-justified instead of fully-justified.
 * ⁠            Note that the second line is also left-justified becase it
 * contains only one word.
 * 
 * 
 * Example 3:
 * 
 * 
 * Input:
 * words =
 * ["Science","is","what","we","understand","well","enough","to","explain",
 * "to","a","computer.","Art","is","everything","else","we","do"]
 * maxWidth = 20
 * Output:
 * [
 * "Science  is  what we",
 * ⁠"understand      well",
 * "enough to explain to",
 * "a  computer.  Art is",
 * "everything  else  we",
 * "do                  "
 * ]
 * 
 * 
 */

// @lc code=start
class Solution68 {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        if words.count == 0 {
            return []
        }

        var result = [String]()
        var start = 0
        var curWidth = words.first!.count

        for end in 1..<words.count {
            var gaps = end - start
            if curWidth + words[end].count + gaps <= maxWidth {
                curWidth += words[end].count
                continue
            }

            gaps -= 1
            let totalSpaces = maxWidth - curWidth

            if gaps == 0 {
                result.append(words[start] + String(repeating: " ", count: totalSpaces))
            } else {
                var spacesPerGap = 0
                while gaps * spacesPerGap < totalSpaces {
                    spacesPerGap += 1
                }

                let a = gaps - gaps * spacesPerGap + totalSpaces

                var line = ""
                for i in start..<end {
                    line += words[i]
                    if i != end - 1 {
                        line += i - start < a ? String(repeating: " ", count: spacesPerGap) : String(repeating: " ", count: spacesPerGap - 1)
                    }
                }
                result.append(line)
            }

            start = end
            curWidth = words[end].count
        }

        let line = words[start..<words.count].joined(separator: " ")
        result.append(line + String(repeating: " ", count: maxWidth - line.count))

        return result
    }
}
// @lc code=end

