//
//  SwiftUIView.swift
//  BookShelf
//
//  Created by 정종원 on 6/17/24.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @State var showEditBookView = false
    var body: some View {
        Form {
            Text(book.title)
            Image(book.largeCoverImageName)
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
                .padding()
            Label(book.author, systemImage: "person.crop.rectangle")
            Button(action: {
                showEditBookView.toggle()
            }, label: {
                Label("Edit", systemImage: "pencil")
            })
            Label("ISBN: \(book.isbn)", systemImage: "number")
            Label("\(book.pages) pages", systemImage: "book")
            Toggle("Read", isOn: .constant(book.isRead))
        }
        .navigationTitle(book.title)
        .sheet(isPresented: $showEditBookView) {
            BookEditView(book: book)
        }
    }
}

#Preview {
    NavigationStack {
        BookDetailView(book: .constant(Book.sampleBooks[0]))
    }
}
