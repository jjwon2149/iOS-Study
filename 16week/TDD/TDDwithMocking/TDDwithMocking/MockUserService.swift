//
//  MockUserService.swift
//  TDDwithMocking
//
//  Created by 정종원 on 7/11/24.
//

import Foundation

class MockUserService: UserService {
    var fetchUserCalled = false
    var mockUser: User?
    var mockError: Error?
    
    func fetchUser(completion: @escaping (User?, (any Error)?) -> Void) {
        fetchUserCalled = true
        completion(mockUser, mockError)
    }
}
