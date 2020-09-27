/*
 * @lc app=leetcode id=105 lang=swift
 *
 * [105] Construct Binary Tree from Preorder and Inorder Traversal
 *
 * https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (47.75%)
 * Likes:    3920
 * Dislikes: 104
 * Total Accepted:    397.5K
 * Total Submissions: 800.2K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * Given preorder and inorder traversal of a tree, construct the binary tree.
 * 
 * Note:
 * You may assume that duplicates do not exist in the tree.
 * 
 * For example, given
 * 
 * 
 * preorder = [3,9,20,15,7]
 * inorder = [9,3,15,20,7]
 * 
 * Return the following binary tree:
 * 
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
class Solution105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildTree(preorder, pStartIndex: 0, pEndIndex: preorder.count - 1,
                         inorder, iStartIndex: 0, iEndIndex: inorder.count - 1)
    }

    func buildTree(_ preorder: [Int], pStartIndex: Int, pEndIndex: Int,
                   _ inorder: [Int], iStartIndex: Int, iEndIndex: Int) -> TreeNode? {
        if pStartIndex < 0 || pEndIndex >= preorder.count || pStartIndex > pEndIndex {
            return nil
        }

        if pStartIndex == pEndIndex {
            return TreeNode(preorder[pStartIndex])
        }

        var i = iStartIndex
        while i < iEndIndex {
            if preorder[pStartIndex] == inorder[i] {
                break
            }

            i += 1
        }

        let node = TreeNode(preorder[pStartIndex])
        if i == iStartIndex {
            node.right = buildTree(preorder, pStartIndex: pStartIndex + 1, pEndIndex: pEndIndex,
                                   inorder, iStartIndex: i + 1, iEndIndex: iEndIndex)
        } else if i == iEndIndex {
            node.left = buildTree(preorder, pStartIndex: pStartIndex + 1, pEndIndex: pEndIndex,
                                  inorder, iStartIndex: iStartIndex, iEndIndex: i - 1)
        } else {
            node.left = buildTree(preorder, pStartIndex: pStartIndex + 1, pEndIndex: pStartIndex + i - iStartIndex,
                                  inorder, iStartIndex: iStartIndex, iEndIndex: i - 1)
            node.right = buildTree(preorder, pStartIndex: pStartIndex + i - iStartIndex + 1, pEndIndex: pEndIndex,
                                   inorder, iStartIndex: i + 1, iEndIndex: iEndIndex)
        }

        return node
    }
}
// @lc code=end

