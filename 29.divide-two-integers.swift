/*
 * @lc app=leetcode id=29 lang=swift
 *
 * [29] Divide Two Integers
 */
extension Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isPositive = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
        var dividend: Int64 = abs(Int64(dividend))
        let divisor: Int64 = abs(Int64(divisor))
        if dividend < divisor {
            return 0
        }

        var result: Int64 = 0

        while dividend >= divisor {
            var tDivisor = divisor

            var turn = 0
            while dividend >= tDivisor {
                dividend -= tDivisor
                tDivisor <<= 1
                result += 1 << turn
                turn += 1
            }
        }

        result = isPositive ? result : -result

        return result > Int32.max ? Int(Int32.max) : Int(result)
    }
}

