//
//  SociallyApp.swift
//  Socially
//
//  Created by 정종원 on 7/23/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SociallyApp: App {
    @StateObject var authModel = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authModel.user == nil {
                    SignUpView()
                } else {
                    FeedView()
                        .environmentObject(PostViewModel())
                }
            }
            .environmentObject(authModel)
            .onAppear {
                authModel.listenToAuthState() //로그인 여부 save
            }
        }
    }
}
