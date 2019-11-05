/*
 * @lc app=leetcode id=22 lang=swift
 *
 * [22] Generate Parentheses
 */
class Solution22 {
    /*
     Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

     For example, given n = 3, a solution set is:

     [
       "((()))",
       "(()())",
       "(())()",
       "()(())",
       "()()()"
     ]
     */
    func generateParenthesis(_ n: Int) -> [String] {
//        if n == 0 {
//            return [""]
//        }
//
//        if n == 1 {
//            return ["()"]
//        }
//
//        var result = [String]()
//        for i in 0..<n {
//            for inner in generateParenthesis(i) {
//                for outer in generateParenthesis(n - 1 - i) {
//                    result.append("(\(inner))\(outer)")
//                }
//            }
//        }
//        return result

        var result = [String]()
        dfs(n, n, "", &result)
        return result
    }

    func dfs(_ left: Int, _ right: Int, _ string: String, _ result: inout [String]) {
        if left > right {
            return
        }

        if left == 0 && right == 0 {
            result.append(string)
        } else {
            if left > 0 {
                dfs(left - 1, right, "\(string)(", &result)
            }

            if right > 0 {
                dfs(left, right - 1, "\(string))", &result)
            }
        }
    }
}

