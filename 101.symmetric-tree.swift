/*
 * @lc app=leetcode id=101 lang=swift
 *
 * [101] Symmetric Tree
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }

    func isMirror(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }

        if let root1 = root1, let root2 = root2, root1.val == root2.val {
            return isMirror(root1.left, root2.right) && isMirror(root1.right, root2.left)
        }

        return false
    }
}

