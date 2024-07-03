//
//  ContentView.swift
//  LocalApp
//
//  Created by 정종원 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeColor = false
    var body: some View {
        VStack {

            //옛 방식
            Text(LocalizedStringKey("greeting-label"))
            
            Text("greeting-label")
            Button("button-label") {
                changeColor.toggle()
            }
        }
        .padding()
        .background(changeColor ? .red : .yellow)
    }
}

#Preview("기본 - 한국어") {
    ContentView()
}

#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("Spanish") {
    ContentView()
        .environment(\.locale, .init(identifier: "es"))
}

#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "fr"))
}
