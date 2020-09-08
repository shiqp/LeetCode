/*
 * @lc app=leetcode id=82 lang=swift
 *
 * [82] Remove Duplicates from Sorted List II
 *
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/description/
 *
 * algorithms
 * Medium (36.26%)
 * Likes:    1706
 * Dislikes: 109
 * Total Accepted:    251.9K
 * Total Submissions: 688.3K
 * Testcase Example:  '[1,2,3,3,4,4,5]'
 *
 * Given a sorted linked list, delete all nodes that have duplicate numbers,
 * leaving only distinct numbers from the original list.
 * 
 * Return the linked list sorted as well.
 * 
 * Example 1:
 * 
 * 
 * Input: 1->2->3->3->4->4->5
 * Output: 1->2->5
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: 1->1->1->2->3
 * Output: 2->3
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
class Solution82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var result: ListNode?
        var p: ListNode?
        var q = head
        var next = q?.next
        var duplicateCount = 0
        while next != nil {
            if next!.val == q!.val {
                next = next?.next
                duplicateCount += 1
            } else if duplicateCount > 0 {
                q = next
                next = next?.next
                duplicateCount = 0
            } else if p == nil {
                result = q
                p = q
                q = next
                next = next?.next
            } else {
                p?.next = q
                p = q
                q = next
                next = next?.next
            }
        }

        if duplicateCount > 0 {
            p?.next = nil
        } else if p == nil {
            result = q
        } else {
            p?.next = q
        }

        return result
    }
}
// @lc code=end

