/*
 * @lc app=leetcode id=87 lang=swift
 *
 * [87] Scramble String
 *
 * https://leetcode.com/problems/scramble-string/description/
 *
 * algorithms
 * Hard (34.23%)
 * Likes:    659
 * Dislikes: 762
 * Total Accepted:    116.7K
 * Total Submissions: 341K
 * Testcase Example:  '"great"\n"rgeat"'
 *
 * We can scramble a string s to get a string t using the following
 * algorithm:
 *
 *
 * If the length of the string is 1, stop.
 * If the length of the string is > 1, do the following:
 *
 * Split the string into two non-empty substrings at a random index, i.e., if
 * the string is s, divide it to x and y where s = x + y.
 * Randomly decide to swap the two substrings or to keep them in the same
 * order. i.e., after this step, s may become s = x + y or s = y + x.
 * Apply step 1 recursively on each of the two substrings x and y.
 *
 *
 *
 *
 * Given two strings s1 and s2 of the same length, return true if s2 is a
 * scrambled string of s1, otherwise, return false.
 *
 *
 * Example 1:
 *
 *
 * Input: s1 = "great", s2 = "rgeat"
 * Output: true
 * Explanation: One possible scenario applied on s1 is:
 * "great" --> "gr/eat" // divide at random index.
 * "gr/eat" --> "gr/eat" // random decision is not to swap the two substrings
 * and keep them in order.
 * "gr/eat" --> "g/r / e/at" // apply the same algorithm recursively on both
 * substrings. divide at ranom index each of them.
 * "g/r / e/at" --> "r/g / e/at" // random decision was to swap the first
 * substring and to keep the second substring in the same order.
 * "r/g / e/at" --> "r/g / e/ a/t" // again apply the algorithm recursively,
 * divide "at" to "a/t".
 * "r/g / e/ a/t" --> "r/g / e/ a/t" // random decision is to keep both
 * substrings in the same order.
 * The algorithm stops now and the result string is "rgeat" which is s2.
 * As there is one possible scenario that led s1 to be scrambled to s2, we
 * return true.
 *
 *
 * Example 2:
 *
 *
 * Input: s1 = "abcde", s2 = "caebd"
 * Output: false
 *
 *
 * Example 3:
 *
 *
 * Input: s1 = "a", s2 = "a"
 * Output: true
 *
 *
 *
 * Constraints:
 *
 *
 * s1.length == s2.length
 * 1 <= s1.length <= 30
 * s1 and s2 consist of lower-case English letters.
 *
 *
 */

// @lc code=start
class Solution87 {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        if s1 == s2 {
            return true
        }

        if s1.count != s2.count || s1.sorted() != s2.sorted() {
            return false
        }

        var i = s1.index(after: s1.startIndex)
        while i != s1.endIndex {
            let subS11 = String(s1[..<i])
            let subS12 = String(s1[i...])
            var subS21 = String(s2[..<i])
            var subS22 = String(s2[i...])

            if isScramble(subS11, subS21) && isScramble(subS12, subS22) {
                return true
            }

            let j = s1.index(s1.startIndex, offsetBy: s1.distance(from: i, to: s1.endIndex))
            subS21 = String(s2[..<j])
            subS22 = String(s2[j...])
            if isScramble(subS11, subS22) && isScramble(subS12, subS21) {
                return true
            }

            i = s1.index(after: i)
        }

        return false
    }
}
// @lc code=end


