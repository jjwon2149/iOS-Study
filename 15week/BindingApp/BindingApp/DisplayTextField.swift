//
//  DisplayTextField.swift
//  BindingApp
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct DisplayTextField: View {
    @Binding var message: String
    var body: some View {
        HStack {
            Text("Send a greeting:")
            TextField("Type a message Here", text: $message)
        }
    }
}

#Preview {
    DisplayTextField(message: .constant("asd"))
}
