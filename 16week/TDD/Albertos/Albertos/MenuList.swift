//
//  ContentView.swift
//  Albertos
//
//  Created by 정종원 on 7/10/24.
//

import SwiftUI

struct MenuList: View {
    let viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
        .navigationTitle("Alberto's 🇮🇹")
    }
}

#Preview {
    NavigationStack {
        MenuList(viewModel: .init())
    }
}
