//
//  SwiftUIView.swift
//  BookShelf
//
//  Created by 정종원 on 6/17/24.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BookDetailView(book: .constant(Book(title: "test", author: "test", isbn: "test", pages: 100)))
}
