//
//  AddWordView.swift
//  WordBrowserWithAsync
//
//  Created by 정종원 on 6/24/24.
//

import SwiftUI

struct AddWordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var word: String = ""
    
    var onAddWord: (String) -> Void
    
    var body: some View {
        Form {
            TextField("Word", text: $word)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .navigationTitle("Add New")
        .onSubmit(handdleOnAddWord)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
//                Button("Done", action: handdleOnAddWord)
//                    .disabled(word.isEmpty)
                
                //onAddWord 클로저를 단어와 함께 호출하여 부모 뷰에서 단어를 처리
                Button {
                    onAddWord(word)
                    dismiss()
                } label: {
                    Text("Done")
                }
                .disabled(word.isEmpty)
            }
        }
    }
    
    private func handdleOnAddWord() {
        onAddWord(word)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddWordView { word in
            print(word)
        }
    }
}
