//
//  AuthViewModel.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import AuthenticationServices
import CryptoKit

class AuthViewModel: ObservableObject {
    @Published var user: User?
    var currentNonce: String?
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.user = user
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
    
    //MARK: - SignInWithApple Methods
    func signInWithApple(request: ASAuthorizationAppleIDRequest) -> Void {
        let nonce = randomNonceString()
        currentNonce = nonce
        request.requestedScopes = [.email]
        request.nonce = sha256(nonce)
    }
    
    func signInWithAppleCompletion(result: Result<ASAuthorization, any Error>) {
        switch result {
        case .success(let authResults):
            switch authResults.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error { print(error.localizedDescription)
                        return
                    }
                    print("signed in")
                    guard let user = authResult?.user else { return }
                    let userData = ["email": user.email, "uid": user.uid]
                    Firestore.firestore().collection("User")
                        .document(user.uid)
                        .setData(userData) { _ in
                            print("DEBUG: Did upload user data.")
                        }
                }
                
                print("\(String(describing: Auth.auth().currentUser?.uid))")
            default:
                break
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Private Methods
    func randomNonceString(length: Int = 32) -> String {
        
        precondition(length > 0)
        
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        //랜덤을 만들기 위한 로직
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in if remainingLength == 0 {
                return
            }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    //해시함수 복호화 불가능한 키값 만들기 (동일한 키를 넣었을때 동일한 해시가 나옴)
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0) }.joined()
        return hashString
    }
}
