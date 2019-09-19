/*
 * @lc app=leetcode id=19 lang=swift
 *
 * [19] Remove Nth Node From End of List
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
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head

        var p: ListNode? = node, q: ListNode? = node
        
        var n = n
        while p != nil {
            p = p?.next
            if n >= 0 {
                n -= 1
            } else {
                q = q?.next
            }
        }

        q?.next = q?.next?.next

        return node.next
    }
}

