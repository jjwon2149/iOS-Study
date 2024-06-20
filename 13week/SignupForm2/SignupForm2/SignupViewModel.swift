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
            .removeDuplicates()
            .flatMap { username -> AnyPublisher<Available, Never> in //또다른 퍼블리셔를 사용하기 위해 flatmap
                self.authenticationService.checkUserNameAvailablePublisher(userName: username)
                    .asResult()
            }
            .share()
            .receive(on: DispatchQueue.main)// 메인 스레드에서
            .eraseToAnyPublisher()
    }()
}
