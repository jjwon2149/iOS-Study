//
//  SignUpView.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @ObservedObject private var authModel = AuthViewModel()
    var body: some View {
        VStack {
            SignInWithAppleButton(onRequest: authModel.signInWithApple(request:), onCompletion: authModel.signInWithAppleCompletion(result:))
            .signInWithAppleButtonStyle(.black)
            .frame(width: 290, height: 45, alignment: .center)
        }
    }
}
