//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by 정종원 on 4/22/24.
//

import SwiftUI
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var title: String
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

//@MainActor
//var previewContainer: ModelContainer {
//    do {
//        let container = try ModelContainer(
//            for: Task.self,
//            configurations: ModelConfiguration(isStoredInMemoryOnly: true))
//        let modelContext = container.mainContext
//        if try modelContext.fetch(FetchDescriptor<Task>()).isEmpty {
//            container.mainContext.insert(Task(title: "Task Demo #1"))
//        }
//        return container
//    } catch {
//        fatalError("Failed to create container")
//    }
//}

struct ContentView: View {
    @Query var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Button {
                            toggleCompletion(for: task)
                        } label: {
                            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle.fill")
                        }
                        Text("\(task.title)")
                        Spacer()
                        if task.completed {
                            Image(systemName: "checkmark")
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            deleteTask(task)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTask()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .modelContainer(for: Task.self)
        .ignoresSafeArea()
    }
    
    
    func addTask() {
        let newTask = Task(title: "Task #\(tasks.count + 1)")
        modelContext.insert(newTask)
    }
    
    func deleteTask(_ task: Task) {
            modelContext.delete(task)
    }
    
    func toggleCompletion(for task: Task) {
        task.completed.toggle()
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self)
}
