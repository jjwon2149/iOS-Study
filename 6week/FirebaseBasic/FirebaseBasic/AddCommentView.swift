//
//  AddCommentView.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI
import FirebaseFirestore

struct AddCommentView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel.shared
    @State private var bodyText: String = ""
    
    var note: Note
    
    var body: some View {
        VStack {
            TextEditor(text: $bodyText)
                .border(.gray)
        }
        .padding(24)
        .navigationTitle("Add Comment")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await addComment()
                        dismiss()
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .disabled(bodyText.isEmpty)
                }
            }
        }
    }
    
    func addComment() async {
        let docReference = Firestore.firestore().collection("notes/\(note.docId!)/comments").document()
        try? await docReference.setData([
            "date": Date(),
            "body": bodyText,
            "userId": authenticationViewModel.userId,
            "username": authenticationViewModel.username,
            "photoURL": authenticationViewModel.photoURL?.absoluteString ?? "",
        ])
    }
}

#Preview {
    AddCommentView(note: Note.sample)
}
