//
//  ViewController.swift
//  LeetCode
//
//  Created by Qingpu Shi on 2019/5/23.
//  Copyright © 2019 Qingpu Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let solution = Solution()
        let _ = solution.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
    }
    
}

