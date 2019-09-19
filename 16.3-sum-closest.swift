/*
 * @lc app=leetcode id=16 lang=swift
 *
 * [16] 3Sum Closest
 */
class Solution16 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()

        var minGap = Int.max
        var i = 0
        while i < nums.endIndex - 2 {
            let first = nums[i]

            var low = i + 1
            var high = nums.endIndex - 1
            while low < high {
                let second = nums[low]
                let third = nums[high]
                let sum = first + second + third

                let gap = sum - target
                if gap == 0 {
                    return target
                }

                if gap < 0 {
                    minGap = abs(minGap) > abs(gap) ? gap : minGap

                    low += 1
                    continue
                }

                if gap > 0 {
                    minGap = abs(minGap) > abs(gap) ? gap : minGap

                    high -= 1
                    continue
                }
            }

            while first == nums[i] && i < nums.endIndex - 2 {
                i += 1
            }
        }

        return target + minGap
    }
}

