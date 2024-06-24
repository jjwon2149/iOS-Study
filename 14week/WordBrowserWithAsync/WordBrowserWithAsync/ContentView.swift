//
//  ContentView.swift
//  WordBrowserWithAsync
//
//  Created by 정종원 on 6/24/24.
//

import SwiftUI

//MARK: - ContentView
struct ContentView: View {
    @StateObject var viewModel = LibraryViewModel()
    @State var isAddNewWordDialogPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                SectionView(title: "Random word", words: [viewModel.randomWord])
                SectionView(title: "Peter's Tips", words: viewModel.filteredTips)
                SectionView(title: "My Favorites", words: viewModel.filteredFavorites)
            } //List
            .searchable(text: $viewModel.searchText)
            .textInputAutocapitalization(.never)
            .navigationTitle("Library")
            .refreshable {
                print("\(#function) is on main thread BEFORE await: \(Thread.isMainThread)")
                await viewModel.refresh()
                print("\(#function) is on main thread AFTER await: \(Thread.isMainThread)")
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isAddNewWordDialogPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            } //toolbar
            .sheet(isPresented: $isAddNewWordDialogPresented) {
                NavigationStack {
                    AddWordView() { word in
                        print(word)
                        viewModel.addFavorite(word)
                    }
                }
            }
        }
    }
}

//MARK: - SectionView
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
        } //Section
    } //body
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
