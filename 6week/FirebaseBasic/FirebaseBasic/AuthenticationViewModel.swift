//
//  AuthenticationViewModel.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/29/24.
//

import Foundation
import Firebase
import FirebaseCore
import GoogleSignIn

extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter ({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({$0})
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first?
            .rootViewController
    }
}

@Observable
final class AuthenticationViewModel {
    enum State {
        case busy
        case signedIn
        case signedOut
    }
    
    var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? "" }
    var emain: String { authResult?.user.email ?? "" }
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.disconnect()
        try? Auth.auth().signOut()
        authResult = nil
        state = .signedOut
    }
    
    func restorePreviousSignin() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error { print("Error \(error.localizedDescription)")}
            Task {
                await self.signIn(user: user)
            }
        }
    }
    
    func login() {
        state = .busy
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let rootViewController = UIApplication.currentRootViewController else {
            return
        }
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil) { result, error in
            if let error { print("Error \(error.localizedDescription)") }
            Task {
                await self.signIn(user: result?.user)
            }
        }
        
    }
    /*
    State 설정
    함수가 실행될 때 먼저 상태를 .busy로 설정합니다. 이것은 앱이 현재 로그인 작업 중임을 나타냅니다.
     
    Google 로그인 구성
    Firebase에서 Google 로그인을 수행하기 위해 필요한 구성을 설정합니다. 이는 Firebase 앱의 클라이언트 ID를 사용하여 Google 로그인의 구성을 생성합니다.
     
    Google 로그인 시작
    GIDSignIn.sharedInstance.signIn 메서드를 호출하여 Google 로그인을 시작합니다.
    signIn 메서드는 화면에 Google 로그인 창을 표시하고 사용자가 로그인을 완료하면 결과와 오류를 처리하는 클로저를 사용합니다.
    로그인 결과에 따라 result에 사용자 정보가 전달됩니다.
     
    사용자 인증
    signIn 메서드에서 반환된 사용자 정보를 기반으로 Firebase에 사용자를 인증합니다.
    사용자의 ID 토큰과 액세스 토큰을 사용하여 Google 사용자를 Firebase 사용자로 인증합니다.
    성공하면 사용자 상태를 .signedIn으로 설정하고 authResult에 결과를 할당합니다.
    실패하면 오류를 처리하고 사용자 상태를 .signedOut으로 설정합니다.
     */
    
    private func signIn(user: GIDGoogleUser?) async {
        guard let user, let idToken = user.idToken else {
            state = .signedOut
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString)
        
        do {
            authResult = try await Auth.auth().signIn(with: credential)
            state = .signedIn
        } catch {
            state = .signedOut
            print("Error \(error.localizedDescription)")
        }
    }
    /*
     매개변수 확인
     함수는 GIDGoogleUser 객체를 매개변수로 받습니다. 이 객체에는 Google 로그인을 통해 받은 사용자 정보가 포함되어 있습니다.
     
     사용자 및 토큰 확인
     함수는 전달받은 GIDGoogleUser 객체와 해당 객체의 ID 토큰을 확인합니다.
     사용자 객체와 ID 토큰이 모두 유효한지 확인합니다. 만약 그렇지 않다면 함수는 사용자 상태를 .signedOut으로 설정하고 종료합니다.
     
     Firebase 사용자 인증
     유효한 사용자 정보가 확인되면 함수는 Google ID 토큰과 액세스 토큰을 사용하여 Firebase에 사용자를 인증합니다.
     GoogleAuthProvider.credential(withIDToken:accessToken:) 메서드를 사용하여 Firebase에 필요한 자격 증명을 생성합니다.
     생성된 자격 증명을 사용하여 Auth.auth().signIn(with:) 메서드를 호출하여 Firebase에 사용자를 인증합니다.
     
     인증 결과 처리
     인증이 성공하면 함수는 반환된 AuthDataResult 객체를 사용하여 사용자 상태를 .signedIn으로 설정하고 authResult에 결과를 할당합니다.
     인증이 실패하면 함수는 오류를 처리하고 사용자 상태를 .signedOut으로 설정합니다.
     */
}
