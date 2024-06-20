//
//  Publisher+Dump.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation
import Combine

extension Publisher {
    func dump() -> AnyPublisher<Self.Output, Self.Failure> {
        handleEvents(receiveOutput: { value in
            Swift.dump(value)
        }, receiveCompletion: { value in
            Swift.dump(value)
        })
        .eraseToAnyPublisher()
    }
}
