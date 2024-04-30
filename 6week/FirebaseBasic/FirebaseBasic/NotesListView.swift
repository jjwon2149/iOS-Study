//
//  NotesListView.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI

struct NotesListView: View {
    
    @State private var service: NoteService = NoteService()
    @State private var isNewNotePresented = false
    
    var body: some View {
        NavigationStack{
            List(service.notes) { note in
                NoteSummaryView(note: note)
            }
        }
        .navigationDestination(for: Note.self) { note in
            NoteDetailView(note: note)
        }
        .navigationTitle("FileNotes")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            service.fetch()
        }
        
    }
}

#Preview {
    NotesListView()
}
