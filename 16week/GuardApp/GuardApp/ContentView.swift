//
//  ContentView.swift
//  GuardApp
//
//  Created by 정종원 on 7/9/24.
//

import SwiftUI

struct ContentView: View {

    @State var showImage: UIImage = UIImage(systemName: "photo")!

    var body: some View {
        VStack {
            Image(uiImage: showImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
            Button {
                getImage()
            } label: {
                Text("Add Picture")
            }
        }
        .padding()
    }

    func getImage() {
       showImage = UIImage(named: "car")!
    }
}

#Preview {
    ContentView()
}
