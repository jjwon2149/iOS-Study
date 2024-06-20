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
        
        guard let url = URL(string: "http://127.0.0.1:8080/isUserNameAvailable?userName=\(userName)") else {
            return Fail(error: APIError.invalidRequestError("URL invalid")).eraseToAnyPublisher()
        }
        
        let dataTaskPublisher = URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error -> Error in
                return APIError.transportError(error)
            }
            .tryMap { (data, response) -> (data: Data, response: URLResponse) in
                print("Received reponse from server, now checking status code")
                
                guard let urlResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                if (200..<300) ~= urlResponse.statusCode { }
                else {
                    let decoder = JSONDecoder()
                    let apiError = try decoder.decode(APIErrorMessage.self, from: data)
                    
                    if urlResponse.statusCode == 400 {
                        throw APIError.validationError(apiError.reason)
                    }
                    
                    if (500..<600) ~= urlResponse.statusCode {
                        let retryAfter = urlResponse.value(forHTTPHeaderField: "Retry-After")
                        throw APIError.serverError(statusCode: urlResponse.statusCode, reason: apiError.reason, retryAfter: retryAfter)
                    }
                }
                return (data, response)
            }
        return dataTaskPublisher
//            .tryCatch { error -> AnyPublisher<(data: Data, response: URLResponse), Error> in // 퍼블리셔에 에러가 발생했을때
//                if case APIError.serverError = error { //APIError.serverError인 경우 재시도
//                    return Just(Void()) //즉시 emit 퍼블리셔
//                        .delay(for: 3, scheduler: DispatchQueue.global())
//                        .flatMap { _ in
//                            return dataTaskPublisher
//                        } // flatMap으로 dataTaskPublisher를 다시 호출
//                        .print("before retry")
//                        .retry(10) // 최대 10번 재시도
//                        .eraseToAnyPublisher()
//                }
//                throw error //APIError.serverError아닌 에러라면 다시 쓰로우
//            }
            .retry(10, withDelay: 3) //위의 tryCatch Operater Custom
            .map(\.data) // dataTaskPublisher에서 데이터를 추출합니다.
            .tryMap { data -> UserNameAvailableMessage in
                let decoder = JSONDecoder()
                do {
                    return try decoder.decode(UserNameAvailableMessage.self, from: data)
                } catch {
                    throw APIError.decodingError(error)
                }
            }
            .map(\.isAvailable) // UserNameAvailableMessage 객체의 isAvailable 속성을 추출하여 Bool 값을 emit
            .eraseToAnyPublisher() // AnyPublisher<Bool, Error>로 반환
    }
}
