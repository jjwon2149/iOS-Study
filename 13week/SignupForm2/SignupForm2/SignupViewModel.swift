//
//  SignupViewModel.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation
import Combine

class SignupViewModel: ObservableObject {
    typealias Available = Result<Bool, Error>
    
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showUpdateDialog: Bool = false
    
    private var authenticationService = AuthenticationService()
    
    //스트림은 lazy로 사용될때 만들어 지도록
    private lazy var isUsernameAvailablePublisher: AnyPublisher<Available, Never> = {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main) //시간 지연해서
            .removeDuplicates() // 연속된 동일한 값의 변화를 무시
            .flatMap { username -> AnyPublisher<Available, Never> in //또다른 퍼블리셔를 사용하기 위해 flatmap
                self.authenticationService.checkUserNameAvailablePublisher(userName: username)
                    .asResult()
            }
            .receive(on: DispatchQueue.main)// 메인 스레드에서
            .print("before share")
            .share()
            .print(" share")
            .eraseToAnyPublisher()
    }()
    
    init() {
        isUsernameAvailablePublisher.map { result in
            switch result {
            case .success(let isAvailable):
                return isAvailable
            case .failure(_):
                return false
            }
        }
        .assign(to: &$isValid)// 매핑된 결과를 isValid에 할당
    }
}
