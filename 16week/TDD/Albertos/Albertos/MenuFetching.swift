//
//  MenuFetching.swift
//  Albertos
//
//  Created by 정종원 on 7/11/24.
//

import Combine

//의존역전
protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
