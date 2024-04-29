//
//  ButtonView.swift
//  Buttons
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct ButtonView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text("Welcome to your second View")
            Text("Current Coung Value \(count)")
            Button {
                count += 1
            } label: {
                Text("Tap to Increment count")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(Capsule())
            }
        }
        .navigationTitle("Button View")
    }
}

#Preview {
    NavigationStack {
        ButtonView()
    }
}
