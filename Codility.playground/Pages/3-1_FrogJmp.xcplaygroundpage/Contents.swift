//: [Previous](@previous)

//A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
//
//Count the minimal number of jumps that the small frog must perform to reach its target.
//
//Write a function:
//
//public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
//that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
//
//For example, given:
//
//X = 10
//Y = 85
//D = 30
//the function should return 3, because the frog will be positioned as follows:
//
//after the first jump, at position 10 + 30 = 40
//after the second jump, at position 10 + 30 + 30 = 70
//after the third jump, at position 10 + 30 + 30 + 30 = 100
//Assume that:
//
//X, Y and D are integers within the range [1..1,000,000,000];
//X ≤ Y.
//Complexity:
//
//expected worst-case time complexity is O(1);
//expected worst-case space complexity is O(1).
//Copyright 2009–2018 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.

import XCTest

class Solution {
    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        if X == Y {
            return 0
        }

        return (Y - X) / D + ((Y - X) % D > 0 ? 1 : 0)
    }
}

class MyTests : XCTestCase {

    func test1Case() {
        XCTAssertEqual(Solution().solution(10, 85, 30), 3)
    }

    func test2Case() {
        XCTAssertEqual(Solution().solution(10, 10, 30), 0)
    }

    func test3Case() {
        XCTAssertEqual(Solution().solution(10, 70, 30), 2)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
