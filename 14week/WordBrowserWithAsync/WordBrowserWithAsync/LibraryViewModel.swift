//
//  LibraryViewModel.swift
//  WordBrowserWithAsync
//
//  Created by 정종원 on 6/24/24.
//

import Foundation
import Combine

class LibraryViewModel: ObservableObject {
    //MARK: - Prpperties
    @Published var randomWord = "partially"
    @Published var searchText = ""
    @Published var tips: [String] = ["Swift", "authentication", "authorization"]
    @Published var favorites: [String] = ["stunning", "brilliant", "marvelous"]
    @Published var filteredTips = [String]()
    @Published var filteredFavorites = [String]()
    
    init() {
        Publishers.CombineLatest($searchText, $tips).map { query, items in
            items.filter { item in
                query.isEmpty ? true : item.contains(query)
            }
        }
        .assign(to: &$filteredTips)
        
        Publishers.CombineLatest($searchText, $favorites).map { query, items in
            items.filter { item in 
                query.isEmpty ? true : item.contains(query)
            }
        }
        .assign(to: &$filteredFavorites)
    }
    
    func addFavorite(_ word: String) {
        favorites.append(word)
    }
}
