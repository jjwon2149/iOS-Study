//
//  Helper.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation
import Combine

struct UserNameAvailableMessage: Codable {
    var isAvailable: Bool
    var userName: String
    //{key: value}
}

// 에러와 에러 메세지
struct APIErrorMessage: Decodable {
    var error: Bool
    var reson: String
}

enum APIError: LocalizedError {
    case invalidResponse
}

extension Publisher {
    func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        //Result 객체는 success거나 failure임.
        self.map(Result.success)
            .catch { error in
                Just(.failure(error))
            }
            .eraseToAnyPublisher() //게시
    }
}
