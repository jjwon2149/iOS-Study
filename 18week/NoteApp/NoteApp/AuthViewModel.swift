//
//  AuthViewModel.swift
//  NoteApp
//
//  Created by 정종원 on 7/23/24.
//

import Foundation
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    func listenToAuthState() {
        //인증정보를 statefull하게 관리 가능
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let user = user else { return }
            self?.user = user
        }
    }
}
