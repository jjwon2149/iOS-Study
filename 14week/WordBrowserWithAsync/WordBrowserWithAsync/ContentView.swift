//
//  ContentView.swift
//  WordBrowserWithAsync
//
//  Created by 정종원 on 6/24/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LibraryViewModel()
    
    var body: some View {
        
        List {
            SectionView(title: "Random word", words: [viewModel.randomWord])
            SectionView(title: "Peter's Tips", words: viewModel.filteredTips)
            SectionView(title: "My Favorites", words: viewModel.filteredFavorites)
        } //List
        .searchable(text: $viewModel.searchText)
        .textInputAutocapitalization(.never)
        .navigationTitle("Library")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct SectionView: View {
    var title: String
    var words: [String]
    
    init(title: String, words: [String]) {
        self.title = title
        self.words = words
    }
    
    var body: some View {
        Section(title) {
            if words.isEmpty {
                Text("No items match your filter criteria")
            } else {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
