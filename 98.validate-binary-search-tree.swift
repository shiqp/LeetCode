/*
 * @lc app=leetcode id=98 lang=swift
 *
 * [98] Validate Binary Search Tree
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return self.isValidBST(root: root, min: nil, max: nil)
    }

    func isValidBST(root: TreeNode?, min: TreeNode?, max: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        if let min = min {
            if min.val >= root.val {
                return false
            }
        }

        if let max = max {
            if max.val <= root.val {
                return false
            }
        }

        return isValidBST(root: root.left, min: min, max: root) && isValidBST(root: root.right, min: root, max: max)
    }
}

