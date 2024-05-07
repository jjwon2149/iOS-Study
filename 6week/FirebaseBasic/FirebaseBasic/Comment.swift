//
//  Comment.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/30/24.
//

import Foundation

struct Comment: Identifiable, Codable, Hashable {
    let date: Date
    let body: String
    let author: String
    let username: String?
    let photoURL: URL?
    var docId: String?
}
