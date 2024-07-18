//
//  LoginView.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            Color(.customBackground)

            VStack(alignment: .leading) {
                Text("Login to your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                TextField(text: $username) {
                    Text("username")
                        .foregroundStyle(.customLoginHaveAn)
                }
                .frame(minWidth: 358, minHeight: 40)
                .padding(10)
                .background(.customSNSLoginButton, in: RoundedRectangle(cornerRadius: 12))
                
                TextField(text: $password) {
                    Text("password")
                        .foregroundStyle(.customLoginHaveAn)
                }
                .frame(minWidth: 358, minHeight: 40)
                .padding(10)
                .background(.customSNSLoginButton, in: RoundedRectangle(cornerRadius: 12))
                
                Text("Forgot password?")
                    .frame(minHeight: 40)
                    .foregroundStyle(.customLoginHaveAn)
                    .padding(5)
                
                Button {
                    
                } label: {
                    Text("Log in")
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                .frame(minWidth: 358, minHeight: 30)
                .padding(10)
                .background(.customLoginButton, in: RoundedRectangle(cornerRadius: 12))
                
                Text("new user? Sign Up")
                    .fontWeight(.heavy)
                    .frame(minWidth: 358, minHeight: 40)
                    .foregroundStyle(.white)
                
            }
            .padding()
        } //ZStack
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
