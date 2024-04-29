//
//  TodoList_jmbaeApp.swift
//  TodoList_jmbae
//
//  Created by 정종원 on 4/25/24.
//

import SwiftUI
import SwiftData

@main
struct TodoList_jmbaeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Task.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    initialzeData()
                }
        }
        .modelContainer(sharedModelContainer)
    }
    
    @MainActor
    private func initialzeData() {
        do {
            let fetchDescriptor = FetchDescriptor<Task>()
            let fetchTasks = try sharedModelContainer.mainContext.fetch(fetchDescriptor)
            
            if fetchTasks.isEmpty {
                for task in Task.tasks {
                    sharedModelContainer.mainContext.insert(task)
                }
            }
        } catch {
            print("Failed \(error)")
        }
    }
}
