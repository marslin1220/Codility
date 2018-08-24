//: [Previous](@previous)

/*
 A non-empty array A consisting of N integers is given.

 A permutation is a sequence containing each element from 1 to N once, and only once.

 For example, array A such that:

 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 is a permutation, but array A such that:

 A[0] = 4
 A[1] = 1
 A[2] = 3
 is not a permutation, because value 2 is missing.

 The goal is to check whether array A is a permutation.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A, returns 1 if array A is a permutation and 0 if it is not.

 For example, given array A such that:

 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 the function should return 1.

 Given array A such that:

 A[0] = 4
 A[1] = 1
 A[2] = 3
 the function should return 0.

 Assume that:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 Complexity:

 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N) (not counting the storage required for input arguments).
 Copyright 2009–2018 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/

import XCTest

class Solution {
    public func solution(_ A : inout [Int]) -> Int {
        // elementCheck 的 value 為 0 代表 index 數字 N-1 不曾出現過，1 表示已經出現過
        var elementCheck = [Int](repeating: 0, count: A.count)

        for element in A {
            if (0 > element || element > A.count) {
                return 0;
            }

            if elementCheck[element-1] == 0 {
                elementCheck[element-1] = 1
            } else {
                return 0;
            }
        }

        return 1;
    }
}

class MyTests : XCTestCase {
    func test1Case() {
        var parameter = [4, 1, 3, 2]
        XCTAssertEqual(Solution().solution(&parameter), 1)
    }

    func test2Case() {
        var parameter = [4, 1, 3]
        XCTAssertEqual(Solution().solution(&parameter), 0)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
