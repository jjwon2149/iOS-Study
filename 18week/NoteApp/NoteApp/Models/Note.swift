//
//  Note.swift
//  NoteApp
//
//  Created by 정종원 on 7/22/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Note: Codable {
    @DocumentID var id: String?
    var title: String?
}
