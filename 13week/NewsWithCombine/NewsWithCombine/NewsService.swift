//
//  NewsService.swift
//  NewsWithCombine
//
//  Created by 정종원 on 6/21/24.
//

import Foundation
import Combine

class NewsService: ObservableObject {
    private let baseURL = "https://openapi.naver.com/v1/search/news.json"
    private let clientID: String
    private let clientSecret: String
    
    init() {
        guard let clientID = Bundle.main.object(forInfoDictionaryKey: "CLIENT_ID") as? String,
              let clientSecret = Bundle.main.object(forInfoDictionaryKey: "CLIENT_SECRET") as? String else {
            fatalError("Apikey plist Error")
        }
        self.clientID = clientID
        self.clientSecret = clientSecret
    }
    
    func searchNews(query: String, page: Int, itemsPerPage: Int) -> AnyPublisher<NewsResponse, Error> {
        guard var components = URLComponents(string: baseURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "start", value: String((page - 1) * itemsPerPage + 1)),
            URLQueryItem(name: "display", value: String(itemsPerPage))
        ]
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    /*
     URLSession 기본방식과 위 코드의 차이
     
     완료핸들러를 사용하지 않아 가독성 있는 코드
     유지보수가 좋아짐
     
     
     
     components로 하며 객체지향 설계에 더욱 가까워짐? 요소를 컨트롤하니오류률 줄임,
     injection query
     */
}
