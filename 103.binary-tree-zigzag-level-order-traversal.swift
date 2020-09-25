/*
 * @lc app=leetcode id=103 lang=swift
 *
 * [103] Binary Tree Zigzag Level Order Traversal
 *
 * https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/description/
 *
 * algorithms
 * Medium (46.66%)
 * Likes:    2534
 * Dislikes: 106
 * Total Accepted:    415.2K
 * Total Submissions: 850.9K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * Given a binary tree, return the zigzag level order traversal of its nodes'
 * values. (ie, from left to right, then right to left for the next level and
 * alternate between).
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
 * return its zigzag level order traversal as:
 * 
 * [
 * ⁠ [3],
 * ⁠ [20,9],
 * ⁠ [15,7]
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
class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var result = [[Int]]()
        var nodes = [root!]
        var LTR = true
        var i = 0
        while i < nodes.count {
            var layer = [Int]()
            let curCount = nodes.count
            if LTR {
                for j in i..<curCount {
                    layer.append(nodes[j].val)

                    if nodes[curCount + i - j - 1].right != nil {
                        nodes.append(nodes[curCount + i - j - 1].right!)
                    }

                    if nodes[curCount + i - j - 1].left != nil {
                        nodes.append(nodes[curCount + i - j - 1].left!)
                    }
                }
            } else {
                for j in i..<curCount {
                    layer.append(nodes[j].val)

                    if nodes[curCount + i - j - 1].left != nil {
                        nodes.append(nodes[curCount + i - j - 1].left!)
                    }

                    if nodes[curCount + i - j - 1].right != nil {
                        nodes.append(nodes[curCount + i - j - 1].right!)
                    }
                }
            }

            LTR = !LTR
            i = curCount
            result.append(layer)
        }

        return result
    }
}
// @lc code=end

