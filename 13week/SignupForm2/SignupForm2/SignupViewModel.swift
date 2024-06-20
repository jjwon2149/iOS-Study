//
//  SignupViewModel.swift
//  SignupForm2
//
//  Created by 정종원 on 6/20/24.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showUpdateDialog: Bool = false
    
}
