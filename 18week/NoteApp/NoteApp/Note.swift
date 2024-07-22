//
//  Note.swift
//  NoteApp
//
//  Created by 정종원 on 7/22/24.
//

import Foundation

struct Note: Codable {
    @DocumentID var id: String?
    var title: String?
}
