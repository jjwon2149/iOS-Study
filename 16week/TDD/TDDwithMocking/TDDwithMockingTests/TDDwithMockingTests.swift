//
//  TDDwithMockingTests.swift
//  TDDwithMockingTests
//
//  Created by 정종원 on 7/11/24.
//

import XCTest
@testable import TDDwithMocking

final class TDDwithMockingTests: XCTestCase {
    
    //MARK: - Test코드 작성
    
    // 성공 테스트
    func testGetuserSuccess() {
        // Mock 객체
        let mockUserService = MockUserService()
        mockUserService.mockUser = User(name: "justName", age: 25)
        
        // Usermanager 초기화
        //UserManager 인스턴스를 생성하고 MockUserService를 주입하여 의존성을 주입합니다.
        let userManager = UserManager(userService: mockUserService)
        
        // 비동기 테스트를 위한 기대치 설정
        //비동기 테스트를 위해 XCTestExpectation을 생성하여 테스트가 완료될 때까지 기다립니다.
        let expectation = self.expectation(description: "Fetch User")
        
        // getUser 호출 및 검증
        userManager.getUser { user in
            XCTAssertNotNil(user)
            XCTAssertEqual(user?.name, "justName")
            XCTAssertEqual(user?.age, 25)
            expectation.fulfill()
        }
        
        // expectation 대기
        wait(for: [expectation], timeout: 1.0)
        
        // 메소드 호출 검증
        XCTAssertTrue(mockUserService.fetchUserCalled)
    }
    
    // 실패 테스트
    func testGetUserFailure() {
        // Mock 객체 생성
        let mockUserService = MockUserService()
        mockUserService.mockError = NSError(domain: "TestError", code: 1, userInfo: nil)
        
        // UserManager 초기화
        //UserManager 인스턴스를 생성하고 MockUserService를 주입하여 의존성을 주입합니다.
        let userManager = UserManager(userService: mockUserService)
        
        // 비동기 테스트를 위한 기대치 설정
        //비동기 테스트를 위해 XCTestExpectation을 생성하여 테스트가 완료될 때까지 기다립니다.
        let expectation = self.expectation(description: "Fetch user")
        
        // getUser 호출 및 검증
        userManager.getUser { user in
            XCTAssertNil(user)
            expectation.fulfill()
        }
        
        // expectation 대기
        wait(for: [expectation], timeout: 1.0)
        
        // 메서드 호출 검증
        XCTAssert(mockUserService.fetchUserCalled)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
