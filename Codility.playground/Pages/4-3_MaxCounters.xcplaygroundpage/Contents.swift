//: [Previous](@previous)

/*
 You are given N counters, initially set to 0, and you have two possible operations on them:

 increase(X) − counter X is increased by 1,
 max counter − all counters are set to the maximum value of any counter.
 A non-empty array A of M integers is given. This array represents consecutive operations:

 if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
 if A[K] = N + 1 then operation K is max counter.
 For example, given integer N = 5 and array A such that:

 A[0] = 3
 A[1] = 4
 A[2] = 4
 A[3] = 6
 A[4] = 1
 A[5] = 4
 A[6] = 4
 the values of the counters after each consecutive operation will be:

 (0, 0, 1, 0, 0)
 (0, 0, 1, 1, 0)
 (0, 0, 1, 2, 0)
 (2, 2, 2, 2, 2)
 (3, 2, 2, 2, 2)
 (3, 2, 2, 3, 2)
 (3, 2, 2, 4, 2)
 The goal is to calculate the value of every counter after all operations.

 Write a function:

 public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
 that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.

 Result array should be returned as an array of integers.

 For example, given:

 A[0] = 3
 A[1] = 4
 A[2] = 4
 A[3] = 6
 A[4] = 1
 A[5] = 4
 A[6] = 4
 the function should return [3, 2, 2, 4, 2], as explained above.

 Assume that:

 N and M are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..N + 1].
 Complexity:

 expected worst-case time complexity is O(N+M);
 expected worst-case space complexity is O(N) (not counting the storage required for input arguments).
 Copyright 2009–2018 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
*/

import XCTest

class Solution {
    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        var currentMax = 0
        var resetMax = 0
        var result = [Int](repeating: 0, count: N)
        var resultMedium = [Int : Int]()

        for element in A {
            if element == N + 1 {
                if currentMax == 0 {
                    continue
                }
                
                resetMax += currentMax
                currentMax = 0
                resultMedium = [Int : Int]()
            } else {
                if let currentValue = resultMedium[element-1] {
                    resultMedium[element-1] = currentValue + 1
                } else {
                    resultMedium[element-1] = 1
                }

                if currentMax < resultMedium[element-1]! {
                    currentMax = resultMedium[element-1]!
                }
            }
        }

        for index in 0..<N {
            if let medium = resultMedium[index] {
                result[index] = medium + resetMax
            } else {
                result[index] = resetMax
            }
        }

        return result
    }
}

class MyTests : XCTestCase {
    func test1() {
        var parameter = [3, 4, 4, 6, 1, 4, 4]
        XCTAssertEqual(Solution().solution(5, &parameter), [3, 2, 2, 4, 2])
    }

    func test2() {
        var parameter = [3, 4, 4, 6, 6, 6, 6]
        XCTAssertEqual(Solution().solution(5, &parameter), [2, 2, 2, 2, 2])
    }

    func test3() {
        var parameter = [6, 6, 6, 6, 3, 4, 4]
        XCTAssertEqual(Solution().solution(5, &parameter), [0, 0, 1, 2, 0])
    }

    func testExtreme_small() {
        var parameter = [6, 6, 6, 6, 6, 6]
        XCTAssertEqual(Solution().solution(5, &parameter), [0, 0, 0, 0, 0])
    }

    func testSingle() {
        var parameter = [1]
        XCTAssertEqual(Solution().solution(5, &parameter), [1, 0, 0, 0, 0])
    }

    func testSmall_random1() {
        var parameter = [21, 7, 14, 21, 14, 21, 18, 5, 5, 21, 14, 7, 6, 21, 6, 14, 18, 15, 4, 10, 19, 5, 10, 10, 12, 10, 17, 4, 16, 21]
        XCTAssertEqual(Solution().solution(20, &parameter), [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9])
    }

    func testSmall_random2() {
        var parameter = [14, 32, 14, 51, 60, 85, 91, 99, 24, 28, 14, 3, 22, 101, 99, 2, 70, 19, 91, 64, 18, 10, 101, 68, 53, 42, 78, 28, 13, 47, 37, 101, 67, 12, 27, 101, 17, 101, 101, 77, 24, 42, 101, 40, 14, 4, 101, 13, 101, 101]
        XCTAssertEqual(Solution().solution(100, &parameter), [Int](repeating: 10, count: 100))
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
