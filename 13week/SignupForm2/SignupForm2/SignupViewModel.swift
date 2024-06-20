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
            .share() //cold observable을 단 한번만 방출시키게 하는 것 cold observable을 단 한번만 방출하게하여 observable 내부가 중복으로 실행되지 않게끔하기 위함 /cold observable : 이벤트를 발행할때 observer가 구독했을때 방출하는 것 (observer가 구독하기 전까지는 방출을 안한다고해서 cold라고 표현) 각각의 observer마다 독립적인 데이터 생성하여 발행 ex) just, single, create
            .print(" share")
            .eraseToAnyPublisher()
    }()
    
    init() {
        isUsernameAvailablePublisher.map { result in
            switch result {
            case .success(let isAvailable):
                return isAvailable
            case .failure(let error):
                if case APIError.transportError(_) = error {
                    return true //retry해야하니 버튼이 살아있어야함
                }
                return false
            }
        }
        .assign(to: &$isValid)// 매핑된 결과를 isValid에 할당
        
        isUsernameAvailablePublisher.map { result in
            switch result {
            case .success(let isAvailable):
                return isAvailable ? "" : "This UserName Is Not Available"
            case .failure(let error):
                if case APIError.transportError(_) = error {
                    return ""
                }
                else if case APIError.validationError(let reason) = error {
                    return reason
                }
                else if case APIError.serverError(statusCode: _, reason: let reason, retryAfter: _) = error {
                    return reason ?? "Server error"
                }
                return error.localizedDescription
            }
        }
        .assign(to: &$usernameMessage)
        
        isUsernameAvailablePublisher.map { result in
            if case .failure(let error) = result {
                if case APIError.decodingError = error {
                    return true
                }
            }
            return false
        }
        .assign(to: &$showUpdateDialog)
    }
}
