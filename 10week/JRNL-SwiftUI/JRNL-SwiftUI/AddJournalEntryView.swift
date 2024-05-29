//
//  AddJournalEntryView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star.")
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        rating = index + 1
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct AddJournalEntryView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var isGetLocationOn = false
    @State private var entryTitle = ""
    @State private var entryBody = ""
    @State private var rating = 0
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("Rating")) {
                    Rectangle()
                        RatingView(rating: $rating)
                }
                Section(header: Text("Location")) {
                    Toggle("Get Location", isOn: $isGetLocationOn)
                }
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $entryTitle)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $entryBody)
                }
                Section(header: Text("Photo")) {
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("Add Journal Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let journalEntry = JournalEntry(rating: 3, entryTitle: entryTitle, entryBody: entryBody, latitude: nil, longitude: nil)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddJournalEntryView()
}
