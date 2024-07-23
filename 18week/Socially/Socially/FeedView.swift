//
//  FeedView.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct FeedView: View {
    
    @FirestoreQuery(collectionPath: "Posts") var posts: [Post]
    @EnvironmentObject private var authModel: AuthViewModel

    var body: some View {
        NavigationStack {
            List(posts) { post in
                VStack(alignment: .leading) {
                    VStack {
                        Text(post.description ?? "")
                            .font(.headline)
                            .padding(12)
                        Text("Published on the \(post.datePublished?.formatted() ?? "")")
                            .font(.caption)
                    }
                }
                .frame(minHeight: 100, maxHeight: 350)
            }
            .navigationTitle("Feed")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        authModel.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(PostViewModel())
}
