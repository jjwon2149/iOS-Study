//
//  MemoWithBaeApp.swift
//  MemoWithBae
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI
import SwiftData

@main
struct MemoWithBaeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
