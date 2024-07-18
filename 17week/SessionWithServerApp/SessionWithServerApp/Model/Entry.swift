//
//  Entry.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import Foundation

struct Entry: Identifiable {
    let id = UUID()
    let date: String
    let text: String
}
