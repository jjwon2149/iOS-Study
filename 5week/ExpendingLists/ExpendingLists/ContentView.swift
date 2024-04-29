//
//  ContentView.swift
//  ExpendingLists
//
//  Created by 정종원 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    let bagContents = [currencies, tools]
    var body: some View {
        List(bagContents, children: \.content) { row in
            Label(row.name, systemImage: row.icon)
        }
    }
}

#Preview {
    ContentView()
}
