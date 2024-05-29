//
//  JournalEntryDetailView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/29/24.
//

import SwiftUI

struct JournalEntryDetailView: View {
    
    @State private var mapImage: UIImage?
    
    var journalEntry: JournalEntry
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 30)
                Text(journalEntry.date.formatted(.dateTime.year().month().day()))
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer().frame(height: 30)
                Text(journalEntry.entryTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 30)
                Text(journalEntry.entryBody)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 30)
                Image(uiImage: journalEntry.photo ?? UIImage(systemName: "face.smiling")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipped()
                Spacer().frame(height: 30)
                Image(uiImage: mapImage ?? UIImage(systemName: "map")!)
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            padding()
        }
        .navigationTitle("Entry Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
