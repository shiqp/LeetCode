/*
 * @lc app=leetcode id=56 lang=swift
 *
 * [56] Merge Intervals
 *
 * https://leetcode.com/problems/merge-intervals/description/
 *
 * algorithms
 * Medium (37.10%)
 * Likes:    2801
 * Dislikes: 222
 * Total Accepted:    446.7K
 * Total Submissions: 1.2M
 * Testcase Example:  '[[1,3],[2,6],[8,10],[15,18]]'
 *
 * Given a collection of intervals, merge all overlapping intervals.
 * 
 * Example 1:
 * 
 * 
 * Input: [[1,3],[2,6],[8,10],[15,18]]
 * Output: [[1,6],[8,10],[15,18]]
 * Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into
 * [1,6].
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: [[1,4],[4,5]]
 * Output: [[1,5]]
 * Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 * 
 * NOTE: input types have been changed on April 15, 2019. Please reset to
 * default code definition to get new method signature.
 * 
 */

// @lc code=start
class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 {
            return []
        }

        var intervals = intervals
        intervals.sort {
            return $0[0] < $1[0]
        }

        var result = [[Int]]()
        result.append(intervals.removeFirst())
        for interval in intervals {
            let lastElement = result.last!
            if lastElement[1] < interval[0] {
                result.append(interval)
            } else if lastElement[1] < interval[1] {
                result.removeLast()

                let newInterval = [lastElement[0], interval[1]]
                result.append(newInterval)
            }
        }

        return result
    }
}
// @lc code=end

