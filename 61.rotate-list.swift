/*
 * @lc app=leetcode id=61 lang=swift
 *
 * [61] Rotate List
 *
 * https://leetcode.com/problems/rotate-list/description/
 *
 * algorithms
 * Medium (29.61%)
 * Likes:    1141
 * Dislikes: 984
 * Total Accepted:    266K
 * Total Submissions: 898.2K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * Given a linked list, rotate the list to the right by k places, where k is
 * non-negative.
 * 
 * Example 1:
 * 
 * 
 * Input: 1->2->3->4->5->NULL, k = 2
 * Output: 4->5->1->2->3->NULL
 * Explanation:
 * rotate 1 steps to the right: 5->1->2->3->4->NULL
 * rotate 2 steps to the right: 4->5->1->2->3->NULL
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: 0->1->2->NULL, k = 4
 * Output: 2->0->1->NULL
 * Explanation:
 * rotate 1 steps to the right: 2->0->1->NULL
 * rotate 2 steps to the right: 1->2->0->NULL
 * rotate 3 steps to the right: 0->1->2->NULL
 * rotate 4 steps to the right: 2->0->1->NULL
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
class Solution61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var p = head
        var length = 0
        while p != nil {
            length += 1
            p = p?.next
        }

        if length == 0 || length == 1 {
            return head
        }

        var k = k % length
        if k == 0 {
            return head
        }
        
        var a = head
        var b = head
        while a?.next != nil {
            if k <= 0 {
                b = b?.next
            }
            a = a?.next
            k -= 1
        }

        let newHead = b?.next
        b?.next = nil
        a?.next = head
        return newHead
    }
}
// @lc code=end

