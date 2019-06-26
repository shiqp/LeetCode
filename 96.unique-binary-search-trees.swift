/*
 * @lc app=leetcode id=96 lang=swift
 *
 * [96] Unique Binary Search Trees
 */
extension Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var cache = [Int]()
        cache.append(1)
        cache.append(1)
        cache.append(2)

        for i in 3...n {
            var num = 0
            for j in 1...i {
                num += cache[j - 1] * cache[i - j]
            }
            cache.append(num)
        }

        return cache[n]
    }
}

