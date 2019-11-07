/*
 * @lc app=leetcode id=49 lang=swift
 *
 * [49] Group Anagrams
 *
 * https://leetcode.com/problems/group-anagrams/description/
 *
 * algorithms
 * Medium (50.49%)
 * Likes:    2180
 * Dislikes: 134
 * Total Accepted:    428.2K
 * Total Submissions: 848.1K
 * Testcase Example:  '["eat","tea","tan","ate","nat","bat"]'
 *
 * Given an array of strings, group anagrams together.
 * 
 * Example:
 * 
 * 
 * Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 * Output:
 * [
 * ⁠ ["ate","eat","tea"],
 * ⁠ ["nat","tan"],
 * ⁠ ["bat"]
 * ]
 * 
 * Note:
 * 
 * 
 * All inputs will be in lowercase.
 * The order of your output does not matter.
 * 
 * 
 */

// @lc code=start
class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var records = [String]()
        var flag = false

        for str in strs {
            let recordItem = String(str.sorted())
            flag = false
            for i in 0..<records.count {
                if records[i] == recordItem {
                    result[i].append(str)
                    flag = true
                    break
                }
            }
            
            if flag == false {
                result.append([str])
                records.append(recordItem)
            }
        }
        
        return result
    }
}
// @lc code=end

