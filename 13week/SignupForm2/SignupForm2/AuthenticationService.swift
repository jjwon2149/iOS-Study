//
//  AuthenticationService.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation
import Combine

struct AuthenticationService {
    //swift vapor로 만든 서버에서 유저이름이 맞는지 확인하는 메서드
    func checkUserNameAvailablePublisher(userName: String) -> AnyPublisher<Bool, Error> {
        return Fail(error: APIError.invalidResponse).eraseToAnyPublisher()
    }
}
