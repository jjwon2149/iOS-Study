//
//  UserService.swift
//  TDDwithMocking
//
//  Created by 정종원 on 7/11/24.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping (User?, Error?) -> Void)
}
