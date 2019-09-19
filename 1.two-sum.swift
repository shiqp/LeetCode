/*
 * @lc app=leetcode id=1 lang=swift
 *
 * [1] Two Sum
 */
class Solution1 {
    /*
     Given an array of integers, return indices of the two numbers such that they add up to a specific target.

     You may assume that each input would have exactly one solution, and you may not use the same element twice.

     Example:

     Given nums = [2, 7, 11, 15], target = 9,

     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1].
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary = [Int: Int]()
        for i in 0..<nums.count {
            let anotherNum = target - nums[i]
            if let j = dictionary[anotherNum], i != j {
                return [i, j]
            }

            dictionary[nums[i]] = i
        }

        return [Int]()
    }
}

