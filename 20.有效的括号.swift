/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 *
 * https://leetcode-cn.com/problems/valid-parentheses/description/
 *
 * algorithms
 * Easy (44.53%)
 * Likes:    2948
 * Dislikes: 0
 * Total Accepted:    916.8K
 * Total Submissions: 2.1M
 * Testcase Example:  '"()"'
 *
 * 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 * 
 * 有效字符串需满足：
 * 
 * 
 * 左括号必须用相同类型的右括号闭合。
 * 左括号必须以正确的顺序闭合。
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：s = "()"
 * 输出：true
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：s = "()[]{}"
 * 输出：true
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：s = "(]"
 * 输出：false
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：s = "([)]"
 * 输出：false
 * 
 * 
 * 示例 5：
 * 
 * 
 * 输入：s = "{[]}"
 * 输出：true
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * s 仅由括号 '()[]{}' 组成
 * 
 * 
 */

// @lc code=start
class Solution20 {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        
        if s.count == 1 {
            return false
        }
        
        var stack = [Character]()
        for element in s {
            if stack.isEmpty {
                stack.append(element)
                continue
            }
            
            if (stack.last == "(" && element == ")") ||
                (stack.last == "[" && element == "]") ||
                (stack.last == "{" && element == "}") {
                stack.removeLast()
            } else {
                stack.append(element)
            }
        }
        
        return stack.isEmpty
    }
}
// @lc code=end

