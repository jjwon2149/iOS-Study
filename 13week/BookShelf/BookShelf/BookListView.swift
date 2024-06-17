//
//  ContentView.swift
//  BookShelf
//
//  Created by 정종원 on 6/17/24.
//

import SwiftUI

class BooksViewModel: ObservableObject {
    @Published var books: [Book] = Book.sampleBooks
}

struct BookListView: View {
    @StateObject var booksViewModel = BooksViewModel()
    
    var body: some View {
        List(booksViewModel.books) { book in
            BookRowView(book: book)
        }
        .listStyle(.plain)
    }
}

#Preview {
    BookListView()
}
