/*
 * @lc app=leetcode id=155 lang=swift
 *
 * [155] Min Stack
 */

class MinStack {

    private var stack: [Int]
    private var min: [Int]

    /** initialize your data structure here. */
    init() {
        self.stack = [Int]()
        self.min = [Int]()
    }
    
    func push(_ x: Int) {
        self.stack.insert(x, at: 0)
        if self.min.isEmpty || self.min.first! >= x {
            self.min.insert(x, at: 0)
        }
    }
    
    func pop() {
        if self.stack.isEmpty {
            return
        }

        if self.stack.removeFirst() == self.min.first {
            self.min.removeFirst()
        }
    }
    
    func top() -> Int {
        if let top = self.stack.first {
            return top
        }

        return -1
    }
    
    func getMin() -> Int {
        if let min = self.min.first {
            return min
        }

        return -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

