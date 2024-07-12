//
//  NetworkFetchingStub.swift
//  AlbertosTests
//
//  Created by 정종원 on 7/12/24.
//

import XCTest
import Combine

@testable import Albertos

class NetworkFetchingStub: NetworkFetching {
    private let result: Result<Data, URLError>
    init(returning result: Result<Data, URLError>) {
        self.result = result
    }

    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return result.publisher
            .delay(for: 0.1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
