/*
 * @lc app=leetcode id=15 lang=swift
 *
 * [15] 3Sum
 */
extension Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()

        var result = [[Int]]()
        var i = 0
        while i < nums.endIndex - 2 {
            let first = nums[i]
            let target = -first

            var low = i + 1
            var high = nums.endIndex - 1
            while low < high {
                let second = nums[low]
                let third = nums[high]
                if second + third < target {
                    low += 1
                    continue
                }

                if second + third > target {
                    high -= 1
                    continue
                }

                result.append([first, second, third])

                while nums[low] == second && low < nums.endIndex - 1 {
                    low += 1
                }

                while nums[high] == third && high > low {
                    high -= 1
                }
            }

            while nums[i] == first && i < nums.endIndex - 2 {
                i += 1
            }
        }

        return result
    }
}

