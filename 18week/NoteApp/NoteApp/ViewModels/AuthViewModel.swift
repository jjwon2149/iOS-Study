//
//  AuthViewModel.swift
//  NoteApp
//
//  Created by 정종원 on 7/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    func listenToAuthState() {
        //인증정보를 statefull하게 관리 가능
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let user = user else { return }
            self?.user = user
        }
    }
    
    func signIn(emailAddress: String, password: String) {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signUp(emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("create error: \(error.localizedDescription)")
                return
            } else {
                print("user id : \(result?.user.uid ?? "-")")
                //                guard let uid = Auth.auth().currentUser?.uid else { return }
                guard let uid = result?.user.uid else { return }
                Firestore.firestore().collection("Users").document(uid).setData(["email" : emailAddress, "uid": uid]) { err in
                    if let err = err {
                        print(err)
                        return
                    }
                    print("Success")
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("signOut Error: \(signOutError)")
        }
    }
    
    func resetPassword(emailAddress: String) {
        Auth.auth().sendPasswordReset(withEmail: emailAddress) { error in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            print("done")
        }
    }
}