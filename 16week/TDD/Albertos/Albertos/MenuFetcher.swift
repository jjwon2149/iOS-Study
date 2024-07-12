//
//  MenuFetcher.swift
//  Albertos
//
//  Created by 정종원 on 7/12/24.
//

import Foundation
import Combine

class MenuFetcher: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success([])) }.eraseToAnyPublisher()
    }
}
