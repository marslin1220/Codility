//: [Previous](@previous)

//A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.
//
//Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
//
//The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
//
//In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
//
//For example, consider array A such that:
//
//A[0] = 3
//A[1] = 1
//A[2] = 2
//A[3] = 4
//A[4] = 3
//We can split this tape in four places:
//
//P = 1, difference = |3 − 10| = 7
//P = 2, difference = |4 − 9| = 5
//P = 3, difference = |6 − 7| = 1
//P = 4, difference = |10 − 3| = 7
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.
//
//For example, given:
//
//A[0] = 3
//A[1] = 1
//A[2] = 2
//A[3] = 4
//A[4] = 3
//the function should return 1, as explained above.
//
//Assume that:
//
//N is an integer within the range [2..100,000];
//each element of array A is an integer within the range [−1,000..1,000].
//Complexity:
//
//expected worst-case time complexity is O(N);
//expected worst-case space complexity is O(N) (not counting the storage required for input arguments).
//Copyright 2009–2018 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.

import XCTest

class Solution {
    public func solution(_ A : inout [Int]) -> Int {
        var sums = [Int](repeating: 0, count: A.count-1)
        var totalSum = 0
        var minDiff = Int.max

        for (index, element) in A.enumerated() {
            totalSum += element

            if (index == A.count - 1) {
                break;
            }

            sums[index] = totalSum
        }

        for element in sums {
            let currentDiff = abs((2 * element) - totalSum)

            if minDiff > currentDiff {
                minDiff = currentDiff
            }
        }

        return minDiff
    }
}

class MyTests : XCTestCase {
    func test1Case() {
        var parameter = [3, 1, 2, 4, 3]
        XCTAssertEqual(Solution().solution(&parameter), 1)
    }

    func test2Case() {
        var parameter = [-1000, 1000]
        XCTAssertEqual(Solution().solution(&parameter), 2000)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
