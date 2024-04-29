//
//  ContentView.swift
//  StorageDemo
//
//  Created by 정종원 on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
