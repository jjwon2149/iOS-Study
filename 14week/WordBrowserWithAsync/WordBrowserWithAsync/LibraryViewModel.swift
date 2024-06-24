//
//  LibraryViewModel.swift
//  WordBrowserWithAsync
//
//  Created by 정종원 on 6/24/24.
//

import Foundation

class LibraryViewModel: ObservableObject {
    //MARK: - Prpperties
    @Published var randomWord = "partially"
    @Published var searchText = ""
    @Published var tips: [String] = ["Swift", "authentication", "authorization"]
    @Published var favorites: [String] = ["stunning", "brilliant", "marvelous"]
    @Published var filteredTips = [String]()
    @Published var filteredFavorites = [String]()
}
