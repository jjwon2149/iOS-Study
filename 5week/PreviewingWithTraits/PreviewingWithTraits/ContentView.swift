//
//  ContentView.swift
//  PreviewingWithTraits
//
//  Created by 정종원 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.teal
                .frame(width: 200, height: 150)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello World!")
                    .font(.title2)
            }
            .foregroundStyle(.primary)
            .padding(.all, 20)
            .background()
            .border(.tertiary, width: 10)
            
        }
    }
}

#Preview("Protrait") {
    ContentView()
}

#Preview("LandScape", traits: .landscapeLeft) {
    ContentView()
}

#Preview("UpsideDown", traits: .portraitUpsideDown) {
    ContentView()
}

#Preview("SizeThatFitsLayout", traits: .sizeThatFitsLayout) {
    ContentView()
}

#Preview("Fixed", traits: .fixedLayout(width: 500, height: 200)) {
    ContentView()
}

