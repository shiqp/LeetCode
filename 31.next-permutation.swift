/*
 * @lc app=leetcode id=31 lang=swift
 *
 * [31] Next Permutation
 */
class Solution31 {
    /*
     Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

     If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

     The replacement must be in-place and use only constant extra memory.

     Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

     1,2,3 → 1,3,2
     3,2,1 → 1,2,3
     1,1,5 → 1,5,1
     */
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }

        if nums.count == 2 {
            nums.swapAt(0, 1)
            return
        }

        var i = nums.count - 1
        while i > 0 {
            if nums[i] > nums[i - 1] {
                var j = nums.count - 1
                while j >= i {
                    if nums[j] > nums[i - 1] {
                        nums.swapAt(j, i - 1)
                        break
                    }

                    j -= 1
                }
                break
            }
            i -= 1
        }

        nums[i...].sort()
    }
}

