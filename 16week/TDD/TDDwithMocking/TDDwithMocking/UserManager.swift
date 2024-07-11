//
//  UserManager.swift
//  TDDwithMocking
//
//  Created by 정종원 on 7/11/24.
//

import Foundation

class UserManager {
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func getUser(completion: @escaping (User?) -> Void) {
        userService.fetchUser { user, error in
            if let error = error {
                print("fetching error: \(error.localizedDescription)")
                completion(nil)
            } else {
                completion(user)
            }
        }
    }
}
