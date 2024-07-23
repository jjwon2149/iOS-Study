//
//  Post.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    @ServerTimestamp var datePublished: Date?
}
