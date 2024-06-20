//
//  AuthenticationService.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation
import Combine

struct AuthenticationService {
    //swift vapor로 만든 서버에서 유저이름이 맞는지 확인하는 메서드 (컴바인 활용
    func checkUserNameAvailablePublisher(userName: String) -> AnyPublisher<Bool, Error> {
        
        guard let url = URL(string: "http://127.0.0.1:8080/isUserNameAvailable?userName=\(userName)") else { return Fail(error: APIError.invalidResponse)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) //Result의 data정보
            .decode(type: UserNameAvailableMessage.self, decoder: JSONDecoder())
            .map(\.isAvailable) //decode된 정보에서 isAvailable만 뽑기
            .eraseToAnyPublisher()
    }
}
