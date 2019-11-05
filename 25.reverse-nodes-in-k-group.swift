/*
 * @lc app=leetcode id=25 lang=swift
 *
 * [25] Reverse Nodes in k-Group
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
class Solution25 {
    /*
     Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

     k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

     Example:

     Given this linked list: 1->2->3->4->5

     For k = 2, you should return: 2->1->4->3->5

     For k = 3, you should return: 3->2->1->4->5

     Note:

     Only constant extra memory is allowed.
     You may not alter the values in the list's nodes, only nodes itself may be changed.
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k <= 1 {
            return head
        }

        let dummy = ListNode(0)
        dummy.next = head

        var length = 0
        var cur = head
        while cur != nil {
            length += 1
            cur = cur?.next
        }

        cur = head
        var pre: ListNode? = dummy
        while length >= k {
            for _ in 0..<k - 1 {
                let next = cur?.next
                cur?.next = next?.next
                next?.next = pre?.next
                pre?.next = next
            }

            pre = cur
            cur = cur?.next
            length -= k
        }

        return dummy.next
    }
}

