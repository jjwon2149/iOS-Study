//
//  RemoteConfigureApp.swift
//  RemoteConfigure
//
//  Created by 정종원 on 4/29/24.
//

import SwiftUI
import FirebaseCore

@main
struct RemoteConfigureApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
