//
//  NewEntryView.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import SwiftUI

struct NewEntryView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    init() {
                
        //Navigation Title foreground color change
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
    }
    
    var body: some View {
        ZStack {
            Color(.customBackground)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TextField(text: $title) {
                    Text("Title")
                        .foregroundStyle(.customLoginHaveAn)
                }
                .foregroundStyle(.customLoginHaveAn)
                .padding()
                .background(.customSNSLoginButton)
                .cornerRadius(8)
                
                TextField(text: $content) {
                    Text("Content")
                        .foregroundStyle(.customLoginHaveAn)
                }
                .foregroundStyle(.customLoginHaveAn)
                .padding()
                .frame(height: 200, alignment: .topLeading)
                .background(.customSNSLoginButton)
                .cornerRadius(12)
                
                
                
                Button(action: {
                    // Handle submit action
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.customLoginButton)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            
        }
        .navigationBarTitle("New entry", displayMode: .inline)
    }
}

#Preview {
    NewEntryView()
}
