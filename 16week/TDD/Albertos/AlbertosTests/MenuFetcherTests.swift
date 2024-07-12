//
//  MenuFetcherTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/12/24.
//

import XCTest
import Combine

@testable import Albertos

final class MenuFetcherTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testWhenRequestSucceedsPublishesDecodedMenuItems() {
        let menuFetcher = MenuFetcher()
        let expectation = XCTestExpectation(description: "Publishes decoded [MenuItem]")
        
        menuFetcher.fetchMenu()
            .sink(receiveCompletion: { _ in }, receiveValue: {
                items in
                // TODO: items 값이 올바른지 테스트
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
    func testWhenRequestFailsPublishesReceivedError() {}
}
