//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/11/24.
//

import XCTest

@testable import Albertos

final class MenuListViewModelTests: XCTestCase {
    func testCallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        let probeClosure: ([MenuItem]) -> [MenuSection] = { _ in
            called = true
            return inputSections
        }

        let viewModel = MenuList.ViewModel(menu: [.fixture()], menuGrouping: probeClosure)
        let sections = viewModel.sections

        // Check that the given closure was called
        XCTAssertTrue(called)
        // Check that the returned value was build with the closure
        XCTAssertEqual(sections, inputSections)
    }
}
