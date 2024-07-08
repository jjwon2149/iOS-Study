//
//  SwiftUIView.swift
//  UIKitWithCodeOnly
//
//  Created by 정종원 on 7/8/24.
//

import SwiftUI

struct SwiftUIView: View {
    let name: String
    var body: some View {
        Text("Hello, \(name)")
    }
}

#Preview {
    SwiftUIView(name: "JAJA")
}
