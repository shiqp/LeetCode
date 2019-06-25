/*
 * @lc app=leetcode id=94 lang=swift
 *
 * [94] Binary Tree Inorder Traversal
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
class Solution {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()

        if let root = root {
            let left = inorderTraversal(root.left);
            result.append(contentsOf: left)

            result.append(root.val)

            let right = inorderTraversal(root.right)
            result.append(contentsOf: right)
        }

        return result
    }
}

