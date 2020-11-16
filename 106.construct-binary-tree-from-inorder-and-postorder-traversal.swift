/*
 * @lc app=leetcode id=106 lang=swift
 *
 * [106] Construct Binary Tree from Inorder and Postorder Traversal
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return buildTree(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
    }

    func buildTree(_ inorder: [Int], _ startI: Int, _ endI: Int, 
                   _ postorder: [Int], _ startP: Int, _ endP: Int) -> TreeNode? {
        if endI - startI != endP - startP ||
           endI < startI || endP < startP {
            return nil
        }

        let node = TreeNode(postorder[endP])
        for i in startI...endI {
            if inorder[i] == postorder[endP] {
                node.left = buildTree(inorder, startI, i - 1, postorder, startP, i - 1 - startI + startP)
                node.right = buildTree(inorder, i + 1, endI, postorder, i - startI + startP, endP - 1)
                break
            }
        }

        return node
    }
}
// @lc code=end

