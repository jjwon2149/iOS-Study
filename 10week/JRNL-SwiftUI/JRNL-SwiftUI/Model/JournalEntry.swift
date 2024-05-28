//
//  JournalEntry.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI
import SwiftData

@Model
class JournalEntry {
    let date: Date
    let rating: Int
    let entryTitle: String
    let entryBody: String
    let latitude: String?
    let longitude: String?
    
    init(rating: Int,
         entryTitle: String,
         entryBody: String,
         latitude: String,
         longitude: String
    ) {
        self.date = Date()
        self.rating = rating
        self.entryTitle = entryTitle
        self.entryBody = entryBody
        self.latitude = latitude
        self.longitude = longitude
    }
}
