/*
 * @lc app=leetcode id=24 lang=swift
 *
 * [24] Swap Nodes in Pairs
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution24 {
    /*
     Given a linked list, swap every two adjacent nodes and return its head.

     You may not modify the values in the list's nodes, only nodes itself may be changed.

     Example:

     Given 1->2->3->4, you should return the list as 2->1->4->3.
     */
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        let node = ListNode(0)
        node.next = head

        var p = head
        var q = p?.next
        var pre: ListNode? = node
        while q != nil {
            p?.next = q?.next
            q?.next = p
            pre?.next = q

            pre = p
            p = p?.next
            q = p?.next
        }

        return node.next
    }
}

