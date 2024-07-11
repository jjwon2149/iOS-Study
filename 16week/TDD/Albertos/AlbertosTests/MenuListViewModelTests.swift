//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/11/24.
//

import XCTest
import Combine

@testable import Albertos

final class MenuListViewModelTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
    
    func testWhenFetchingStartsPublishesEmptyMenu() {
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingSample())
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesSectionBuiltFromReceivedMenuAndGivenGroupingClosure() {
        var receivedMenu: [MenuItem]?
        var expectedSections: [MenuSection] = [.fixture()]
        
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            receivedMenu = items
            return expectedSections
        }
        
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingSample(),
            menuGrouping: spyClosure
        )
        
        let expectation = XCTestExpectation(description: "받은 메뉴와 주어진 그룹화 클로저를 사용하여 생성된 섹션들을 발행합니다.")
        
        viewModel.$sections
            .dropFirst()
            .sink { value in
                XCTAssertEqual(receivedMenu, menu)
                XCTAssertEqual(value, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1) //expectation이 나올때까지 기다리는 코드
    }
}
