/*
 * @lc app=leetcode id=99 lang=swift
 *
 * [99] Recover Binary Search Tree
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
    var first: TreeNode?
    var second: TreeNode?
    var prev: TreeNode?

    func recoverTree(_ root: TreeNode?) {
        inOrder(root)

        guard let first = first, let second = second else {
            return
        }

        let val = first.val
        first.val = second.val
        second.val = val
    }

    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }

        inOrder(root.left)

        if let prev = prev, prev.val > root.val {
            if first == nil {
                first = prev
            }

            second = root
        }

        prev = root

        inOrder(root.right)
    }
}

