//
//  LifeCycleDemoApp.swift
//  LifeCycleDemo
//
//  Created by 정종원 on 4/19/24.
//

import SwiftUI

@main
struct LifeCycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {
            switch $1 {
            case .active:
                print("Active triggerd")
            case .inactive:
                print("inactive triggerd")
            case .background:
                print("background triggerd")
            default:
                print("Unknown scenephase triggerd")
            }
        }
    }
}
