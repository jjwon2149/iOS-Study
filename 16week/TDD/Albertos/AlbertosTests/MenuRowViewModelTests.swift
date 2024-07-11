//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/11/24.
//

import XCTest
@testable import Albertos //target membership에서 체크를 하는 기능

//TDD에선 test코드 작성후 뷰모델만드는 순서로 거꾸로 진행
final class MenuRowViewModelTests: XCTestCase {
    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        // 컴파일러가 말합니다: Type 'MenuRow' has no member 'ViewModel'
        XCTAssertEqual(viewModel.text, "name")
    }
    func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji() {
        let item = MenuItem.fixture(name: "name", spicy: true)
        let viewModel = MenuRow.ViewModel(item: item)
        // 컴파일러가 말합니다: Type 'MenuRow' has no member 'ViewModel'
        XCTAssertEqual(viewModel.text, "name 🌶")
    }
}
