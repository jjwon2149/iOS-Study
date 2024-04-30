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
        .toolbar {
            Button {
                isNewNotePresented.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
            }
        }
        .sheet(isPresented: $isNewNotePresented) {
            AddNoteView(service: service)
        }
        .task {
            service.fetch()
        }
        
    }
}

#Preview {
    NotesListView()
}
