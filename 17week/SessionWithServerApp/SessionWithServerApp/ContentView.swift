//
//  ContentView.swift
//  SessionWithServerApp
//
//  Created by 정종원 on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.customBackground)
            VStack {
                Image("loginImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 218)
                    .padding()
                
                Text("Create stunning social graphics in seconds")
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                VStack {
                    Button{
                        
                    } label: {
                        Text("Continue with Google")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 358, minHeight: 20)
                    .padding(10)
                    .background(.customSNSLoginButton, in: RoundedRectangle(cornerRadius: 12))
                    
                    
                    Button{
                        
                    } label: {
                        Text("Continue with Facebook")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 358, minHeight: 20)
                    .padding(10)
                    .background(.customSNSLoginButton, in: RoundedRectangle(cornerRadius: 12))
                    
                    Button{
                        
                    } label: {
                        Text("Continue with Apple")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 358, minHeight: 20)
                    .padding(10)
                    .background(.customSNSLoginButton, in: RoundedRectangle(cornerRadius: 12))
                    
                    Button{
                        
                    } label: {
                        Text("Sign up for free")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 358, minHeight: 20)
                    .padding(10)
                    
                    Button{
                        
                    } label: {
                        Text("Have an account already? Log in.")
                            .foregroundStyle(.customLoginHaveAn)
                    }
                } //VStack
                .padding()


            } //VStack
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    ContentView()
}
