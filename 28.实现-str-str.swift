/*
 * @lc app=leetcode.cn id=28 lang=swift
 *
 * [28] 实现 strStr()
 *
 * https://leetcode-cn.com/problems/implement-strstr/description/
 *
 * algorithms
 * Easy (40.29%)
 * Likes:    1246
 * Dislikes: 0
 * Total Accepted:    552.3K
 * Total Submissions: 1.4M
 * Testcase Example:  '"hello"\n"ll"'
 *
 * 实现 strStr() 函数。
 * 
 * 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0
 * 开始）。如果不存在，则返回  -1 。
 * 
 * 
 * 
 * 说明：
 * 
 * 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 * 
 * 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf()
 * 定义相符。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：haystack = "hello", needle = "ll"
 * 输出：2
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：haystack = "aaaaa", needle = "bba"
 * 输出：-1
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：haystack = "", needle = ""
 * 输出：0
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * haystack 和 needle 仅由小写英文字符组成
 * 
 * 
 */

// @lc code=start
class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        
        if needle.count > haystack.count {
            return -1
        }
        
        if needle.count == haystack.count {
            return haystack.compare(needle) == .orderedSame ? 0 : -1
        }
        
        var haystack = haystack.cString(using: .utf8)!
        var needle = needle.cString(using: .utf8)!
        haystack.removeLast()
        needle.removeLast()
        
        let next = getNext(needle)
        
        var i = 0
        var j = 0
        
        while i < haystack.count && j < needle.count {
            if j == -1 || haystack[i] == needle[j] {
                i += 1
                j += 1
            } else {
                j = next[j]
            }
        }

        return j < needle.count ? -1 : i - j
    }
    
    func getNext(_ str: [CChar]) -> [Int] {
        if str.isEmpty {
            return []
        }

        var next = Array(repeating: -1, count: str.count)
        
        var j = 1, k = -1
        while j < str.count {
            if k == -1 || str[k] == str[j - 1] {
                k += 1
                next[j] = k
                j += 1
            } else {
                k = next[k]
            }
        }
        
        return next
    }
}
// @lc code=end

