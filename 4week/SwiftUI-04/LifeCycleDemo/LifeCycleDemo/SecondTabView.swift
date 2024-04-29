//
//  SecondTabView.swift
//  LifeCycleDemo
//
//  Created by 정종원 on 4/19/24.
//

import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text) {
                print("On Change Trigger oldValue:\($0), oldValue:\($1)")
            }
    }
}

#Preview {
    SecondTabView()
}
