//
//  ContentView.swift
//  StateManagement
//
//  Created by 정종원 on 6/17/24.
//

import SwiftUI

struct ParentView: View {
    @State var favoriteNumber: Int
    var body: some View {
        VStack {
            Text("Your favorite number is \(favoriteNumber)")
            ChildView(number: $favoriteNumber)
        }
        .padding()
    }
}

struct ChildView: View {
    @Binding var number: Int
    var body: some View {
        VStack {
            Stepper("\(number)", value: $number, in: 0...100)
        }
    }
}
//
//#Preview {
//    ContentView()
//}
