/*
 * @lc app=leetcode id=93 lang=swift
 *
 * [93] Restore IP Addresses
 *
 * https://leetcode.com/problems/restore-ip-addresses/description/
 *
 * algorithms
 * Medium (35.01%)
 * Likes:    1425
 * Dislikes: 524
 * Total Accepted:    206.7K
 * Total Submissions: 571.3K
 * Testcase Example:  '"25525511135"'
 *
 * Given a string s containing only digits, return all possible valid IP
 * addresses that can be obtained from s. You can return them in any order.
 * 
 * A valid IP address consists of exactly four integers, each integer is
 * between 0 and 255, separated by single dots and cannot have leading zeros.
 * For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and
 * "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP
 * addresses. 
 * 
 * 
 * Example 1:
 * Input: s = "25525511135"
 * Output: ["255.255.11.135","255.255.111.35"]
 * Example 2:
 * Input: s = "0000"
 * Output: ["0.0.0.0"]
 * Example 3:
 * Input: s = "1111"
 * Output: ["1.1.1.1"]
 * Example 4:
 * Input: s = "010010"
 * Output: ["0.10.0.10","0.100.1.0"]
 * Example 5:
 * Input: s = "101023"
 * Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
 * 
 * 
 * Constraints:
 * 
 * 
 * 0 <= s.length <= 3000
 * s consists of digits only.
 * 
 * 
 */

// @lc code=start
class Solution93 {
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count > 12 {
            return []
        }

        return restoreIpAddresses(s, seg: 4)
    }

    func restoreIpAddresses(_ s: String, seg: Int) -> [String] {
        if seg == 1 {
            if s.count < 1 || s.count > 3 {
                return []
            }

            if s.count == 2 && s.first! == "0" {
                return []
            }

            if s.count == 3 && (s.first! == "0" || s > "255") {
                return []
            }

            return [s]
        }

        if s.count < seg {
            return []
        }

        var addresses = [String]()

        var curSegment = s.prefix(1)
        let segments = restoreIpAddresses(String(s.suffix(s.count - 1)), seg: seg - 1)
        for segment in segments {
            addresses.append(curSegment + "." + segment)
        }

        if curSegment == "0" {
            return addresses
        }

        if s.count >= 2 {
            curSegment = s.prefix(2)
            let segments = restoreIpAddresses(String(s.suffix(s.count - 2)), seg: seg - 1)
            for segment in segments {
                addresses.append(curSegment + "." + segment)
            }
        }

        if s.count >= 3 && s.prefix(3) <= "255" {
            curSegment = s.prefix(3)
            let segments = restoreIpAddresses(String(s.suffix(s.count - 3)), seg: seg - 1)
            for segment in segments {
                addresses.append(curSegment + "." + segment)
            }
        }

        return addresses
    }
}
// @lc code=end

