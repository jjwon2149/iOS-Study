//
//  ContentView.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = SignupViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundStyle(.red)
            }
            
            Section {
                Button("Sign Up") {
                    print("Sign up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
        .alert("Please Update", isPresented: $viewModel.showUpdateDialog, actions: {
            Button("Upgrade") {
                
            }
            Button("Not now", role: .cancel) {}
        }, message: {
            Text("It looks like you're using an older version if this app. please update your app")
        })
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
