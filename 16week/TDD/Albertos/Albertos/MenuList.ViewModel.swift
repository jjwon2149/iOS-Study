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
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        
        private var cancellables = Set<AnyCancellable>()
        init(menuFetching: MenuFetching = MenuFetchingSample(),
             menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
            menuFetching
                .fetchMenu()
                .map(menuGrouping)
                .sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        self?.sections = .failure(error)
                    },
                    receiveValue: { [weak self] value in
                        self?.sections = .success(value)
                    }
                )
                .store(in: &cancellables)
        }
    }
}
