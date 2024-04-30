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
    }
}

#Preview {
    NoteDetailView(note: Note.sample)
}
