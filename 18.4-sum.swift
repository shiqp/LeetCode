/*
 * @lc app=leetcode id=18 lang=swift
 *
 * [18] 4Sum
 */
extension Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()

        var result = [[Int]]()
        var i = 0
        while i < nums.endIndex - 3 {
            let first = nums[i]
            var j = i + 1

            while j < nums.endIndex - 2 {
                let second = nums[j]

                var low = j + 1
                var high = nums.endIndex - 1

                while low < high {
                    let third = nums[low]
                    let fourth = nums[high]

                    let sum = first + second + third + fourth
                    if sum < target {
                        low += 1
                        continue
                    }

                    if sum > target {
                        high -= 1
                        continue
                    }

                    result.append([first, second, third, fourth])

                    while nums[low] == third && low < nums.endIndex - 1 {
                        low += 1
                    }

                    while nums[high] == fourth && high > low {
                        high -= 1
                    }
                }

                while nums[j] == second && j < nums.endIndex - 2 {
                    j += 1
                }
            }

            while nums[i] == first && i < nums.endIndex - 3 {
                i += 1
            }
        }
        return result
    }
}

