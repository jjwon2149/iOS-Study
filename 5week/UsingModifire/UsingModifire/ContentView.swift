//
//  ContentView.swift
//  UsingModifire
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .clipShape(Capsule())
    }
}

extension View {
    func customBackgroundStyle(color: Color) -> some View {
        modifier(BackgroundStyle(bgColor: color))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Perfect")
                .modifier(BackgroundStyle(bgColor: .red))
            
            Text("Perfect")
                .customBackgroundStyle(color: .blue)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
