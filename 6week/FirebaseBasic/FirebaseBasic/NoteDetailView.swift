//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI
import FirebaseFirestore

struct NoteDetailView: View {
    
    var note: Note
    
    var body: some View {
        VStack(spacing: 12) {
            Text(note.docId ?? "N/A")
                .font(.headline)
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
                NavigationLink(destination: AddCommentView(note: note)) {
                    HStack{
                        Image(systemName: "text.bubble.fill")
                        Text("Add Comment")
                    }
                }
                .padding()
                .border(.gray)
            }
        }
        .task {
            await loadComments()
        }
    }
    mutating func loadComments() async {
        let collection = Firestore.firestore().collection("/notes/\(note.docId!)/comments")
        collection.getDocument { [self] querySnapshot, error in
            self.comments = querySnapshot?.documents.map { $0.data() } ?? []
        }
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note.sampleWithLongBody)
    }
}
