/*
 * @lc app=leetcode id=92 lang=swift
 *
 * [92] Reverse Linked List II
 *
 * https://leetcode.com/problems/reverse-linked-list-ii/description/
 *
 * algorithms
 * Medium (38.29%)
 * Likes:    2717
 * Dislikes: 154
 * Total Accepted:    291.9K
 * Total Submissions: 742.6K
 * Testcase Example:  '[1,2,3,4,5]\n2\n4'
 *
 * Reverse a linked list from position m to n. Do it in one-pass.
 * 
 * Note: 1 ≤ m ≤ n ≤ length of list.
 * 
 * Example:
 * 
 * 
 * Input: 1->2->3->4->5->NULL, m = 2, n = 4
 * Output: 1->4->3->2->5->NULL
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
class Solution92 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil || m >= n {
            return head
        }

        let dummy = ListNode(0)
        dummy.next = head

        var p: ListNode?
        for _ in 0..<m {
            if p == nil {
                p = dummy
            } else {
                p = p?.next
            }
        }

        let q = p?.next
        var count = n - m
        while count > 0 {
            let temp = q?.next
            q?.next = temp?.next
            temp?.next = p?.next
            p?.next = temp
            count -= 1
        }

        return dummy.next
    }
}
// @lc code=end

