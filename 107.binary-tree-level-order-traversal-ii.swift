/*
 * @lc app=leetcode id=107 lang=swift
 *
 * [107] Binary Tree Level Order Traversal II
 *
 * https://leetcode.com/problems/binary-tree-level-order-traversal-ii/description/
 *
 * algorithms
 * Easy (54.38%)
 * Likes:    1781
 * Dislikes: 227
 * Total Accepted:    384.3K
 * Total Submissions: 706.7K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * Given a binary tree, return the bottom-up level order traversal of its
 * nodes' values. (ie, from left to right, level by level from leaf to root).
 * 
 * 
 * For example:
 * Given binary tree [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 
 * return its bottom-up level order traversal as:
 * 
 * [
 * ⁠ [15,7],
 * ⁠ [9,20],
 * ⁠ [3]
 * ]
 * 
 * 
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
class Solution107 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        self.levelOrderBottom(root, level: 0, result: &result)
        return result
    }

    func levelOrderBottom(_ root: TreeNode?, level: Int, result: inout [[Int]]) {
        guard let root = root else {
            return
        }

        if result.count <= level {
            result.insert([root.val], at: 0)
        } else {
            result[result.count - 1 - level].append(root.val)
        }

        levelOrderBottom(root.left, level: level + 1, result: &result)
        levelOrderBottom(root.right, level: level + 1, result: &result)
    }
}
// @lc code=end

