/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
 *
 * https://leetcode-cn.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (41.67%)
 * Likes:    2009
 * Dislikes: 0
 * Total Accepted:    720.4K
 * Total Submissions: 1.7M
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * 编写一个函数来查找字符串数组中的最长公共前缀。
 * 
 * 如果不存在公共前缀，返回空字符串 ""。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：strs = ["flower","flow","flight"]
 * 输出："fl"
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：strs = ["dog","racecar","car"]
 * 输出：""
 * 解释：输入不存在公共前缀。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= strs.length <= 200
 * 0 <= strs[i].length <= 200
 * strs[i] 仅由小写英文字母组成
 * 
 * 
 */

// @lc code=start
class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        var minStr = strs.first!
        var maxStr = strs.first!
        
        for str in strs {
            if minStr.compare(str) == .orderedDescending {
                minStr = str
            }
            
            if maxStr.compare(str) == .orderedAscending {
                maxStr = str
            }
        }
        
        return minStr.commonPrefix(with: maxStr)
    }
}
// @lc code=end

