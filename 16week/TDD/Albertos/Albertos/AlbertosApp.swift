//
//  AlbertosApp.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import SwiftUI

@main
struct AlbertosApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MenuList(sections: groupMenuByCategory(menu))
                    .navigationTitle("Alberto's")
            }
        }
    }
}

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
