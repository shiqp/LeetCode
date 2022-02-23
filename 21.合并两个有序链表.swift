/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 *
 * https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (66.68%)
 * Likes:    2176
 * Dislikes: 0
 * Total Accepted:    847.4K
 * Total Submissions: 1.3M
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：l1 = [1,2,4], l2 = [1,3,4]
 * 输出：[1,1,2,3,4,4]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：l1 = [], l2 = []
 * 输出：[]
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：l1 = [], l2 = [0]
 * 输出：[0]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 两个链表的节点数目范围是 [0, 50]
 * -100 
 * l1 和 l2 均按 非递减顺序 排列
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
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else {
            return list2
        }

        guard let list2 = list2 else {
            return list1
        }
        
        var p = list1
        var q = list2
        
        if list1.val > list2.val {
            p = list2
            q = list1
        }

        let head = p
        
        while p.next != nil {
            while p.next != nil && p.next!.val <= q.val {
                p = p.next!
            }
            
            guard let pNext = p.next else {
                break
            }
            
            var qNext = q.next
            var temp = q
            
            while qNext != nil && pNext.val >= qNext!.val {
                temp = qNext!
                qNext = temp.next
            }

            p.next = q
            temp.next = pNext
            
            if qNext == nil {
                return head
            }
            
            p = pNext
            q = qNext!
        }
        
        p.next = q

        return head
    }
}
// @lc code=end

