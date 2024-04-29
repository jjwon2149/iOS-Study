//
//  SignUpView.swift
//  SignUp
//
//  Created by 정종원 on 4/26/24.
//

import SwiftUI

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct SignUpView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThanTwo = false
    @State private var username = ""
    @State private var password = ""
    @State private var usernameErrorMessage = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Names") {
                    TextField("First Name", text: $firstName)
                    if !usernameErrorMessage.isEmpty {
                        Text(usernameErrorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                    TextField("Last Name", text: $lastName)
                }
                Section("Current Address") {
                    TextField("Street Address", text: $address.street)
                    TextField("City Address", text: $address.city)
                    TextField("PostalCode Address", text: $address.postalCode)
                    Toggle(isOn: $lessThanTwo) {
                        Text("Have You Lived Here for 2+ Year?")
                    }
                }
                
                if !lessThanTwo {
                    Section("Previous Address") { //이전 주소 입력
                        TextField("Street Address", text: $address2.street)
                        TextField("City Address", text: $address2.city)
                        TextField("PostalCode Address", text: $address2.postalCode)
                    }
                }
                
                Section {
                    TextField("Create UserName", text: $username)
                    SecureField("Create Password", text: $password)
                }
                
                Button("Submit") {
                    usernameErrorMessage = "Username을 입력하세요."
                    //TODO: Submit 함수 작성
                }
                
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
