//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by 정종원 on 4/22/24.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") private var editorText = ""
    var body: some View {
        TextEditor(text: $editorText)
            .padding(38)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
