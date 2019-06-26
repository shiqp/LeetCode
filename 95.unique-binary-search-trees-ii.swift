/*
 * @lc app=leetcode id=95 lang=swift
 *
 * [95] Unique Binary Search Trees II
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return self.generateTrees(start: 1, end: n)
    }

    func generateTrees(start: Int, end: Int) -> [TreeNode] {
        if start > end {
            return []
        } else if start == end {
            let root = TreeNode(start)
            return [root]
        }

        var treeNodes = [TreeNode]()
        for i in start...end {
            let leftNodes = self.generateTrees(start: start, end: i - 1)
            let rightNodes = self.generateTrees(start: i + 1, end: end)
            if leftNodes.isEmpty {
                for node in rightNodes {
                    let root = TreeNode(i)
                    root.right = node
                    treeNodes.append(root)
                }
            } else if rightNodes.isEmpty {
                for node in leftNodes {
                    let root = TreeNode(i)
                    root.left = node
                    treeNodes.append(root)
                }
            } else {
                for left in leftNodes {
                    for right in rightNodes {
                        let root = TreeNode(i)
                        root.left = left
                        root.right = right
                        treeNodes.append(root)
                    }
                }
            }
        }

        return treeNodes
    }
}

