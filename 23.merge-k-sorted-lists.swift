/*
 * @lc app=leetcode id=23 lang=swift
 *
 * [23] Merge k Sorted Lists
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
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        
        var lists = lists
        var gap = 1
        while gap < lists.count {
            for i in stride(from: 0, to: lists.endIndex - gap, by: gap * 2) {
                lists[i] = mergeList(lists[i], lists[i + gap])
            }
            gap *= 2
        }

        return lists[0]
    }

    func mergeList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let node = list2 else {
            return list1
        }

        let head = ListNode(Int.min)
        head.next = list1

        var p: ListNode? = head
        var q: ListNode? = node
        while p?.next != nil && q != nil {
            if p!.next!.val <= q!.val {
                p = p?.next
            } else {
                let temp = q?.next
                q?.next = p?.next
                p?.next = q
                p = q
                q = temp
            }
        }

        if q != nil {
            p?.next = q
        }

        return head.next
    }
}

