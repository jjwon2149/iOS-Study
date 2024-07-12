//
//  URLSession+NetworkFetching.swift
//  Albertos
//
//  Created by 정종원 on 7/12/24.
//

import Foundation
import Combine

extension URLSession: NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
