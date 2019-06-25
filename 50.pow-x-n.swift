/*
 * @lc app=leetcode id=50 lang=swift
 *
 * [50] Pow(x, n)
 */
extension Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }

        let result = myPow(x, n / 2)
        if n % 2 == 0 {
            return result * result
        }

        if n > 0 {
            return result * result * x
        } else {
            return result * result / x
        }
    }
}

