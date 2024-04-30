//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    var body: some View {
        VStack(spacing: 12) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
        }
        .padding(24)
        .navigationTitle("Note Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: AddCommentView()) {
                    HStack{
                        Image(systemName: "text.bubble.fill")
                        Text("Add Comment")
                    }
                }
                .padding()
                .border(.gray)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note.sample)
    }
}
