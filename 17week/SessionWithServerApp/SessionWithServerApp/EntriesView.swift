//
//  EntriesView.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import SwiftUI

struct Entry: Identifiable {
    let id = UUID()
    let date: String
    let text: String
}

struct EntriesView: View {
    
    var entries: [Entry] = [
        Entry(date: "Jan 25, 2023", text: "I have started a new project at work."),
        Entry(date: "Dec 12, 2022", text: "My brother is visiting from the west coast for the holidays."),
        Entry(date: "Nov 10, 2022", text: "I'm thinking about moving to a new city."),
        Entry(date: "Oct 23, 2022", text: "I just finished reading a great book on minimalism."),
        Entry(date: "Sep 5, 2022", text: "I'm going to travel to Italy next year."),
        Entry(date: "Aug 18, 2022", text: "I'm starting to learn how to play the guitar.")
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.customBackground)
                
                NavigationStack {
                    List(entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.date)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(entry.text)
                                .font(.subheadline)
                                .foregroundStyle(.customLoginHaveAn)
                            
                        }
                        .listRowBackground(Color.customBackground)
                    }
                    .background(.customBackground)
                    .navigationBarTitle("Entries", displayMode: .inline)
                    .toolbar {
                        ToolbarItem {
                            Button {
                                print("tap!")
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                    .imageScale(.large)
                                    .padding()
                            }
                        }
                    } //toolbar
                    
                }
            } //ZStack
        } //NavigationStack
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    EntriesView()
}
