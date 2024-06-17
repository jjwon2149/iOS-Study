//
//  ContentView.swift
//  SimpleView
//
//  Created by 정종원 on 6/17/24.
//
 
import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        List {
            Label("Hello, World", systemImage: "globe")
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(Color.accentColor)
                Text("Hello, World")
            }
            .font(.system(.body, design: .monospaced))
            TextField("TextField", text: $text)
            Button("Tap Me") {
                print("Tap 실행")
                self.text = "You Tapped Me!"
            }
        }
    }
}

#Preview {
    ContentView()
}
