/*
 * @lc app=leetcode id=86 lang=swift
 *
 * [86] Partition List
 *
 * https://leetcode.com/problems/partition-list/description/
 *
 * algorithms
 * Medium (40.83%)
 * Likes:    1484
 * Dislikes: 321
 * Total Accepted:    226.7K
 * Total Submissions: 540.2K
 * Testcase Example:  '[1,4,3,2,5,2]\n3'
 *
 * Given a linked list and a value x, partition it such that all nodes less
 * than x come before nodes greater than or equal to x.
 * 
 * You should preserve the original relative order of the nodes in each of the
 * two partitions.
 * 
 * Example:
 * 
 * 
 * Input: head = 1->4->3->2->5->2, x = 3
 * Output: 1->2->2->4->3->5
 * 
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var less: ListNode?
        var lessTail: ListNode?
        var greaterOrEqual: ListNode?
        var greaterOrEqualTail: ListNode?

        var p = head
        while p != nil {
            if p!.val < x {
                if less == nil {
                    less = p
                    lessTail = p
                } else {
                    lessTail?.next = p
                    lessTail = p
                }
            } else {
                if greaterOrEqual == nil {
                    greaterOrEqual = p
                    greaterOrEqualTail = p
                } else {
                    greaterOrEqualTail?.next = p
                    greaterOrEqualTail = p
                }
            }

            p = p?.next
        }

        if less == nil {
            return greaterOrEqual
        }

        lessTail?.next = greaterOrEqual
        greaterOrEqualTail?.next = nil
        return less
    }
}
// @lc code=end

