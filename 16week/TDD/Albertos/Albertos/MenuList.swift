//
//  ContentView.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import SwiftUI

struct MenuList: View {
    let sections: [MenuSection]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
    }
}

#Preview {
    MenuList(sections: groupMenuByCategory(menu))
}
