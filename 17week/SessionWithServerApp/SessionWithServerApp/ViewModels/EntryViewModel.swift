//
//  EntryViewModel.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import Foundation

class EntryViewModel: ObservableObject {
    @Published var entries: [Entry]
}
