//
//  AddJournalEntryView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI

struct AddJournalEntryView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isGetLocationOn = false
    @State private var entryTitle = ""
    @State private var entryBody = ""
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("Rating")) {
                    Rectangle()
                        .foregroundStyle(.cyan)
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
