/*
 * @lc app=leetcode id=69 lang=swift
 *
 * [69] Sqrt(x)
 */
extension Solution {
    func mySqrt(_ x: Int) -> Int {
        var low = 0
        var high = x
        var result = 0

        while low <= high {
            let mid = (low + high) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid > x {
                high = mid - 1
            } else {
                low = mid + 1
                result = mid
            }
        }
        return result
    }
}

