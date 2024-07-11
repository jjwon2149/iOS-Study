//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/11/24.
//

import XCTest

@testable import Albertos

final class MenuListViewModelTests: XCTestCase {
    func testWhenFetchingStartsPublishesEmptyMenu() {
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingSample())
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
}
