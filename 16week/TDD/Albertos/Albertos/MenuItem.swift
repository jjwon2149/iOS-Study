//
//  MenuItem.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import Foundation

struct MenuItem: Identifiable {
    let category: String
    let name: String
    let spicy: Bool //이렇게 MenuItem을 바꿨을때 fixture에서만 에러가 발생함. 따라서 fixture만 수정하면 됨
    var id: String { name }
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return Dictionary(grouping: menu, by: { $0.category })
        .map { key, value in MenuSection(category: key, items: value) }
        .sorted { $0.category > $1.category }
}
