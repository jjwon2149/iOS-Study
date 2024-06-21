//
//  NewsViewModel.swift
//  NewsWithCombine
//
//  Created by 정종원 on 6/21/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    @Published var searchQuery: String = ""
    
    private let newsService = NewsService()
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var searchNewsPublisher: AnyPublisher<NewsResponse, Error> = {
        $searchQuery
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .removeDuplicates() //쿼리 입력한것 여러번 중복 방지
            .filter { !$0.isEmpty } //빈문자열을 서버에 보내지 않도록.
            .flatMap { query -> AnyPublisher<NewsResponse, Error> in
                return self.newsService.searchNews(query: query, page: 1, itemsPerPage: 20)
            }
            .receive(on: DispatchQueue.main)
            .share()
            .eraseToAnyPublisher()
    }()
    
    //퍼블리셔를 연결
    init() {
        searchNewsPublisher
            .map(\.items)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            }, receiveValue: { newsItems in
                self.newsItems = newsItems
            })
            .store(in: &cancellables)
        
//        정만 센세가 작성한 코드
//        searchNewsPublisher
//            .catch { _ in Empty() }
//            .sink { [weak self] response in
//                self?.newsItems = response.items
//            }
//            .store(in: &cancellables)
    }
}
