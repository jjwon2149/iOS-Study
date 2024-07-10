//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by 정종원 on 7/10/24.
//

import XCTest

func isLeap(_ year: Int) -> Bool {
    guard year % 400 != 0 else { return true }
    guard year % 100 != 0 else { return false }
    return year % 4 == 0
}

final class HelloWorldTests: XCTestCase {
    //윤년 확인 함수
    func testEvenlyDivisibleBy4IsLeap() {
        XCTAssertTrue(isLeap(2020))
    }
    func testEvenlyDivisibleBy100IsNotLeap() {
        XCTAssertFalse(isLeap(2100))
    }
    func testEvenlyDivisibleBy400IsLeap() {
        XCTAssertTrue(isLeap(2000))
    }
    func testEvenlyDivisibleBy4Or400IsNotLeap() {
        XCTAssertFalse(isLeap(2021))
    }
}
