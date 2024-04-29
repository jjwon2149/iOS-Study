//
//  ContentView.swift
//  Buttons
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                NavigationLink("Buttons") {
                    ButtonView()
                }
                NavigationLink("EditButtonView") {
                    EditButtonView()
                }
                NavigationLink("MenuButtonView") {
                    MenuButtonView()
                }
                NavigationLink("PasteButtonView") {
                    PasteButtonView()
                }
                NavigationLink("Details about text") {
                    Text("Very long text that should not be deplayed in a single line becaus it it snot good design")
                        .padding()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle(Text("Main Title"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
