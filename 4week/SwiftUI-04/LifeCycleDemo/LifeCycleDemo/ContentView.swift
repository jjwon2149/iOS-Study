//
//  ContentView.swift
//  LifeCycleDemo
//
//  Created by 정종원 on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                FirstTabView()
                    .tabItem {
                        Image(systemName: "01.circle")
                        Text("First")
                    }
                
                SecondTabView()
                    .tabItem {
                        Image(systemName: "02.circle")
                        Text("Second")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
