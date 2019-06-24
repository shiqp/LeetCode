//
//  Design.swift
//  LeetCode
//
//  Created by Qingpu Shi on 2019/6/24.
//  Copyright © 2019 Qingpu Shi. All rights reserved.
//

import UIKit

class Design: NSObject {

}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
class LRUCache {

    class Node {
        var key: Int
        var value: Int
        var next: Node?
        weak var prev: Node?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private var capacity: Int
    private var dictionary: [Int: Node]
    private var head: Node
    private var tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.dictionary = [Int: Node]()
        self.head = Node(key: 0, value: 0)
        self.tail = Node(key: 0, value: 0)
        self.head.next = self.tail
        self.tail.prev = self.head
    }

    // Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
    func get(_ key: Int) -> Int {
        if let node = self.dictionary[key] {
            self.remove(node)
            self.add(node)
            return node.value
        }

        return -1
    }

    // Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
    func put(_ key: Int, _ value: Int) {
        if let node = self.dictionary[key] {
            self.remove(node)
        }

        let node = Node(key: key, value: value)
        dictionary[key] = node
        self.add(node)

        if dictionary.count > capacity {
            if let first = self.head.next {
                self.remove(first)
                self.dictionary.removeValue(forKey: first.key)
            }
        }
    }

    private func add(_ node: Node) {
        if let last = self.tail.prev {
            last.next = node
            node.prev = last
            node.next = self.tail
            self.tail.prev = node
        }
    }

    private func remove(_ node: Node) {
        guard let prev = node.prev, let next = node.next else {
            return
        }

        prev.next = next
        next.prev = prev
    }
    
}
