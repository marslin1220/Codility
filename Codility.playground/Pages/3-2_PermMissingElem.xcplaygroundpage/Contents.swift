//: [Previous](@previous)

//An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//
//Your goal is to find that missing element.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//that, given an array A, returns the value of the missing element.
//
//For example, given array A such that:
//
//A[0] = 2
//A[1] = 3
//A[2] = 1
//A[3] = 5
//the function should return 4, as it is the missing element.
//
//Assume that:
//
//N is an integer within the range [0..100,000];
//the elements of A are all distinct;
//each element of array A is an integer within the range [1..(N + 1)].
//Complexity:
//
//expected worst-case time complexity is O(N);
//expected worst-case space complexity is O(1) (not counting the storage required for input arguments).
//Copyright 2009–2018 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.

import XCTest

class Solution {
    public func solution(_ A : inout [Int]) -> Int {
        var sum = 0
        let expection = (1 + (A.count + 1)) * (A.count + 1) / 2

        for element in A {
            sum += element
        }

        return expection - sum
    }
}

class MyTests : XCTestCase {
    func test1Case() {
        var parameter = [2, 3, 1, 5]
        XCTAssertEqual(Solution().solution(&parameter), 4)
    }
}

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
