//
//  MenuItem.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import Foundation

struct MenuItem {
    let category: String
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return [MenuSection()]
}
