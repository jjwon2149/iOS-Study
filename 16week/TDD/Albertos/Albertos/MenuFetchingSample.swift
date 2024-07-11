//
//  MenuFetchingSample.swift
//  Albertos
//
//  Created by 정종원 on 7/11/24.
//

import Foundation
import Combine

let menu = [
    MenuItem(category: "starters", name: "Caprese Salad", spicy: false),
    MenuItem(category: "starters", name: "Arancini Balls", spicy: false),
    MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: true),
    MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false),
    MenuItem(category: "drinks", name: "Water", spicy: false),
    MenuItem(category: "drinks", name: "Red Wine", spicy: false),
    MenuItem(category: "desserts", name: "Tiramisù", spicy: false),
    MenuItem(category: "desserts", name: "Crema Catalana", spicy: false),
]

class MenuFetchingSample: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(menu)) }
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
