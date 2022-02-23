/*
 * @lc app=leetcode.cn id=1507 lang=swift
 *
 * [1507] 转变日期格式
 *
 * https://leetcode-cn.com/problems/reformat-date/description/
 *
 * algorithms
 * Easy (58.84%)
 * Likes:    12
 * Dislikes: 0
 * Total Accepted:    11.1K
 * Total Submissions: 18.8K
 * Testcase Example:  '"20th Oct 2052"'
 *
 * 给你一个字符串 date ，它的格式为 Day Month Year ，其中：
 * 
 * 
 * Day 是集合 {"1st", "2nd", "3rd", "4th", ..., "30th", "31st"} 中的一个元素。
 * Month 是集合 {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
 * "Oct", "Nov", "Dec"} 中的一个元素。
 * Year 的范围在 ​[1900, 2100] 之间。
 * 
 * 
 * 请你将字符串转变为 YYYY-MM-DD 的格式，其中：
 * 
 * 
 * YYYY 表示 4 位的年份。
 * MM 表示 2 位的月份。
 * DD 表示 2 位的天数。
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：date = "20th Oct 2052"
 * 输出："2052-10-20"
 * 
 * 
 * 示例 2：
 * 
 * 输入：date = "6th Jun 1933"
 * 输出："1933-06-06"
 * 
 * 
 * 示例 3：
 * 
 * 输入：date = "26th May 1960"
 * 输出："1960-05-26"
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 给定日期保证是合法的，所以不需要处理异常输入。
 * 
 * 
 */

// @lc code=start
class Solution1507 {
    func reformatDate(_ date: String) -> String {
        let elements = date.split(separator: " ")
        guard elements.count == 3 else {
            return ""
        }
        
        let months: [Substring] = ["Jan", "Feb", "Mar",
                                   "Apr", "May", "Jun",
                                   "Jul", "Aug", "Sep",
                                   "Oct", "Nov", "Dec"]
        guard let month = months.firstIndex(of: elements[1]) else {
            return ""
        }
        
        let startIndex = elements[0].startIndex
        let secondIndex = elements[0].index(after: startIndex)
        let day = elements[0].count == 3 ? "0\(elements[0][startIndex])" : String(elements[0][startIndex...secondIndex])
        return "\(elements[2])-\(month + 1 < 10 ? "0" : "")\(month + 1)-\(day)"
    }
}
// @lc code=end

