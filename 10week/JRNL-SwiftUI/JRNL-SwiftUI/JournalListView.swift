//
//  JournalListView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI
import SwiftData

struct JournalListView: View {
    
    @Query(sort: \JournalEntry.date) var journalEntries: [JournalEntry]
    
    @State private var isShowAddJournalView = false
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { journalEntry in
                JournalCell(journalEntry: journalEntry)
                NavigationLink(value: journalEntry) {
                    JournalCell(journalEntry: journalEntry)
                }
                .navigationDestination(for: JournalEntry.self) {
                    journalEntry in
                    JournalEntryDetailView(journalEntry: journalEntry)
                }
            }
            .navigationTitle("Journal List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowAddJournalView = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowAddJournalView) {
                AddJournalEntryView()
            }
        }
    }
}

#Preview {
    JournalListView()
    //inMemory여야 프리뷰 오류 X
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
