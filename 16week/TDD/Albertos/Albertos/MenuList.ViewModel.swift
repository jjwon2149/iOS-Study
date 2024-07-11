//
//  MenuList.ViewModel.swift
//  Albertos
//
//  Created by 정종원 on 7/11/24.
//
import SwiftUI
import Combine

extension MenuList {
    class ViewModel: ObservableObject {
        @Published var sections: [MenuSection] = []
        
        private var cancellable = Set<AnyCancellable>()
        
        init(menuFetching: MenuFetching = MenuFetchingSample(),
             menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
            menuFetching
                .fetchMenu()
                .sink { _ in
                    
                } receiveValue: { [weak self] value in
                    self?.sections = menuGrouping(value)
                }
                .store(in: &cancellable)
        }
    }
}
