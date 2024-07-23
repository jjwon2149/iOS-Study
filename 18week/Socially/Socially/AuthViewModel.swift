//
//  AuthViewModel.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import AuthenticationServices
import CryptoKit

class AuthViewModel: ObservableObject { 
    @Published var user: User?
    var currentNonce: String?
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
