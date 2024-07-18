//
//  EntriesView.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import SwiftUI

struct EntriesView: View {
    
    //Navigation Title foreground color change
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
    }
    
    @State private var entries: [Entry] = []
    @State private var isShowNewEntry = false
    
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
                                //TODO: - NewEntry와 연결
                                isShowNewEntry = true
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                    .imageScale(.large)
                                    .padding()
                            }
                        }
                    } //toolbar
                    .navigationDestination(isPresented: $isShowNewEntry) {
                        NewEntryView()
                    }
                    
                }
            } //ZStack
        } //NavigationStack
        .scrollContentBackground(.hidden)
    }
}



#Preview {
    EntriesView()
}
