//
//  PasteButtonView.swift
//  Buttons
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct PasteButtonView: View {
    @State var text = String()
    var body: some View {
        VStack {
            PasteButton(payloadType: String.self) { strings in
                guard let string = strings.first else {
                    return
                }
                text = string
            }
            .buttonBorderShape(.capsule)
            .labelStyle(.iconOnly)
            .tint(.red)
            
            Text("복사된 텍스트")
            Text("\(text)")
        }
    }
}

#Preview {
    PasteButtonView()
}
