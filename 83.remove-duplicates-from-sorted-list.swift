/*
 * @lc app=leetcode id=83 lang=swift
 *
 * [83] Remove Duplicates from Sorted List
 *
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
 *
 * algorithms
 * Easy (45.00%)
 * Likes:    1525
 * Dislikes: 111
 * Total Accepted:    462.1K
 * Total Submissions: 1M
 * Testcase Example:  '[1,1,2]'
 *
 * Given a sorted linked list, delete all duplicates such that each element
 * appear only once.
 * 
 * Example 1:
 * 
 * 
 * Input: 1->1->2
 * Output: 1->2
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: 1->1->2->3->3
 * Output: 1->2->3
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
class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p = head
        var q = head?.next
        while true {
            while q != nil && p!.val == q!.val {
                q = q?.next
            }

            if q == nil {
                p?.next = nil
                break
            }

            p?.next = q
            p = q
            q = q?.next
        }

        return head
    }
}
// @lc code=end

