//
//  HolderView.swift
//  NoteApp
//
//  Created by 정종원 on 7/23/24.
//

import SwiftUI

struct HolderView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.user == nil {
                SignUpView()
            } else {
                ContentView()
            }
        }
    }
}

#Preview {
    HolderView()
}
