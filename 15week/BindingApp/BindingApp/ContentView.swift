//
//  ContentView.swift
//  BindingApp
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("Hello, \(message)")
            DisplayTextField(message: $message)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
