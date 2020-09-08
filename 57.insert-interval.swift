/*
 * @lc app=leetcode id=57 lang=swift
 *
 * [57] Insert Interval
 *
 * https://leetcode.com/problems/insert-interval/description/
 *
 * algorithms
 * Hard (32.05%)
 * Likes:    1143
 * Dislikes: 140
 * Total Accepted:    209K
 * Total Submissions: 648.7K
 * Testcase Example:  '[[1,3],[6,9]]\n[2,5]'
 *
 * Given a set of non-overlapping intervals, insert a new interval into the
 * intervals (merge if necessary).
 * 
 * You may assume that the intervals were initially sorted according to their
 * start times.
 * 
 * Example 1:
 * 
 * 
 * Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 * Output: [[1,5],[6,9]]
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 * Output: [[1,2],[3,10],[12,16]]
 * Explanation: Because the new interval [4,8] overlaps with
 * [3,5],[6,7],[8,10].
 * 
 * NOTE: input types have been changed on April 15, 2019. Please reset to
 * default code definition to get new method signature.
 * 
 */

// @lc code=start
class Solution57 {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count == 0 {
            return [newInterval]
        }

        var finalIntervals = [[Int]]()
        var newInterval = newInterval

        var i = 0
        for interval in intervals {
            if interval[0] <= newInterval[0] && newInterval[1] <= interval[1] {
                return intervals
            }

            if interval[1] < newInterval[0] {
                finalIntervals.append(interval)
            } else if newInterval[0] <= interval[1] && interval[1] <= newInterval[1] {
                newInterval[0] = min(newInterval[0], interval[0])
            } else if newInterval[0] <= interval[0] && interval[0] <= newInterval[1] {
                newInterval[1] = max(newInterval[1], interval[1])
            } else {
                break
            }

            i += 1
        }
        
        finalIntervals.append(newInterval)
        while i < intervals.count {
            finalIntervals.append(intervals[i])
            i += 1
        }

        return finalIntervals
    }
}
// @lc code=end

