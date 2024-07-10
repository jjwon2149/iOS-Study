//
//  MenuSection.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import Foundation

struct MenuSection: Identifiable {
    let category: String
    let items: [MenuItem]
    var id: String { category }
}
