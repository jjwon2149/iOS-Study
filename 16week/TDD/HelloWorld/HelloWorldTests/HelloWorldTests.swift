//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by 정종원 on 7/10/24.
//

import XCTest

func isLeap(_ year: Int) -> Bool {
    return false
}

final class HelloWorldTests: XCTestCase {
    //윤년 확인 함수
    func testEvenlyDivisibleBy4IsLeap() {
        XCTAssertTrue(isLeap(2020))
    }
    func testEvenlyDivisibleBy100IsNotLeap() {}
    func testEvenlyDivisibleBy400IsLeap() {}
    func testEvenlyDivisibleBy4Or400IsNotLeap() {}
}
