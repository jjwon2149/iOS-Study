//
//  ContentView.swift
//  UsingImages
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.dogs1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(.dog2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 6))
                .shadow(radius: 10)
            Image(uiImage: UIImage(resource: .dogAndNature))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
