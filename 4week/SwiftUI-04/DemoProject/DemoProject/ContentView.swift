//
//  ContentView.swift
//  DemoProject
//
//  Created by 정종원 on 4/17/24.
//

import SwiftUI

struct User: Codable {
    let login: String
    let avatar_url: URL
}

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
}

actor GithubService {
    func fetchUser(username: String) async throws -> User {
        let url = URL(string: "https://api.github.com/users/\(username)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func fetchRepositories(username: String) async throws -> [Repository] {
        let url = URL(string: "https://api.github.com/users/\(username)/repos")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Repository].self, from: data)
    }
}

class GithubViewModel: ObservableObject {
    @Published var user: User?
    @Published var repositories: [Repository] = []
    @Published var error: Error?
    
    let githubService = GithubService()
    
    func fetchData(username: String) async {
        do {
            async let fetchUser = githubService.fetchUser(username: username)
            async let fetchRepository = githubService.fetchRepositories(username: username)
            
            user = try await fetchUser
            repositories = try await fetchRepository
        } catch {
            print("Error: \(error)")
        }
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = GithubViewModel()
    @State private var username = "NewP1"

    
    var body: some View {
        VStack {
            TextField("GitHub username :", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                
                Task {
                    await viewModel.fetchData(username: username)
                }
                
            } label: {
                Text("Fetch Data")
            }
            
            if let user = viewModel.user {
                AsyncImage(url: viewModel.user?.avatar_url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width:100, height:100)
                .clipShape(Circle())
                
                Text(user.login)
                    .font(.title)
            }
            
            List(viewModel.repositories) { repo in
                VStack{
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.description ?? "No description")
                        .font(.subheadline)
                }
            }
            
//            Button{
//                Task.detached {
//                    do {
//                        let service = GithubService()
//                        try await withThrowingTaskGroup(of: Void.self) { group in
//                            group.addTask {
//                                repositories = try await service.fetchRepositories(username: username)
//                            }
//                            
//                            group.addTask {
//                                user = try await service.fetchUser(username: username)
//                            }
//                            try await group.waitForAll()
//                        }
//                        
//                    } catch {
//                        DispatchQueue.main.async {
//                            print("\(error)")
//                        }
//                    }
//                }
//            } label: {
//                Text("Fetch Data in Background")
//            }
           /*버튼의 클로저에서는 Task.detached를 사용하여 백그라운드에서 작업을 실행합니다. withThrowingTaskGroup을 사용하여 여러 비동기 작업을 그룹화하고 모든 작업이 완료될 때까지 기다립니다.
            Task.detached: 비동기적으로 실행될 코드 블록을 나타냅니다. 이 블록은 백그라운드에서 실행됩니다.
            withThrowingTaskGroup: 이 메서드는 여러 비동기 작업을 그룹화합니다. of: Void.self는 반환 유형이 Void인 작업 그룹을 생성한다는 것을 나타냅니다.
            group.addTask: 작업 그룹에 비동기 작업을 추가합니다. 여기서는 사용자 정보 및 리포지토리 목록을 가져오는 두 가지 작업을 추가합니다.
            try await group.waitForAll(): 작업 그룹에 추가된 모든 작업이 완료될 때까지 기다립니다. 즉, 모든 데이터를 가져올 때까지 기다립니다.
            catch: 비동기 작업에서 발생한 오류를 처리합니다. 여기서는 간단히 오류를 콘솔에 출력합니다.*/
        }
    }
}



#Preview {
    ContentView()
}
