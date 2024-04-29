//
//  BlueCircle.swift
//  UsingViewBuilder
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct BlueCircle<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 30)
        }
        .padding()
    }
}

//#Preview {
//    BlueCircle(content: .constant)
//}
