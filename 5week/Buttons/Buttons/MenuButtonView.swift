//
//  MenuButtonView.swift
//  Buttons
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        Menu("Choose a country") {
            Button("Canada") { print("select Canada") }
            Button("Mexico") { print("select Mexico") }
            Button("USA") { print("select USA") }
        }
        .navigationTitle("Menu Button")
    }
}

#Preview {
    NavigationStack{
        MenuButtonView()
    }
}
