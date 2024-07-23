//
//  DetailsView.swift
//  NoteApp
//
//  Created by 정종원 on 7/22/24.
//

import SwiftUI

struct DetailsView: View {
    var note: Note
    @State private var presentAlert = false
    @State private var titleText = ""
    
    @ObservedObject var viewModel: NoteViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(note.title ?? "")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle("Details")
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button {
                        presentAlert.toggle()
                    } label: {
                        Text("Edit").bold()
                    }
                    .alert("Note", isPresented: $presentAlert, actions: {
                        TextField("\(note.title ?? "")", text: $titleText)
                        Button("Update") {
                            viewModel.updateData(title: titleText, id: note.id ?? "")
                            presentAlert = false
                            titleText = ""
                        }
                        Button("Cancel",role: .cancel) {
                            presentAlert = false
                            titleText = ""
                        }
                    }, message: {
                        Text("Write your new note")
                    })
                }
            }
        }
    }
}
