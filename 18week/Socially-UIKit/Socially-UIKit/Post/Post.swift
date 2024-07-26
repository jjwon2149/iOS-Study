//
//  Post.swift
//  Socially-UIKit
//
//  Created by 정종원 on 7/25/24.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    @ServerTimestamp var datePublished: Date?
    
    init?(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        self.description = document.data()["description"] as? String
        self.imageURL = document.data()["imageURL"] as? String
    }
}
