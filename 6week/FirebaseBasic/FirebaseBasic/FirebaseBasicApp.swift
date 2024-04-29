//
//  FirebaseBasicApp.swift
//  FirebaseBasic
//
//  Created by 정종원 on 4/29/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

class Appdelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure() // Firebase 초기화
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        GIDSignIn.sharedInstance.handle(url) // Google Sign-In URL 핸들링
    }
}

@main
struct FirebaseBasicApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate // AppDelegate를 사용하여 앱의 생명주기 이벤트를 처리
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
