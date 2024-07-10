//
//  AlbertosTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/10/24.
//

import XCTest
@testable import Albertos

final class MenuGroupingTests: XCTestCase {
    func testMenuWithManyCategoriesReturnsOneSectionPerCategory() {
        
    }
    
    func testMenuWithOneCategoryReturnOneSection() {
        // 메뉴아이템이 동일한 카테고리를 같는 경우 하나의 섹션으로 구분
        let menu = [
            MenuItem(category: "pastas"),
            MenuItem(category: "pastas"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 1)
    }
    
    func testEmptyMenuReturnsEmptySections() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty)
    }
}
