/*
 * @lc app=leetcode id=102 lang=swift
 *
 * [102] Binary Tree Level Order Traversal
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
extension Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let root = root else {
            return []
        }

        var nodes = [root]
        while !nodes.isEmpty {
            var count = nodes.count
            var vals = [Int]()

            while count != 0 {
                let node = nodes.removeFirst()
                vals.append(node.val)

                if let left = node.left {
                    nodes.append(left)
                }

                if let right = node.right {
                    nodes.append(right)
                }

                count -= 1
            }

            result.append(vals)
        }

        return result
    }
}

