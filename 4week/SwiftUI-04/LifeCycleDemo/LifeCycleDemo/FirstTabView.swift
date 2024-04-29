//
//  FirstTabView.swift
//  LifeCycleDemo
//
//  Created by 정종원 on 4/19/24.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("On Apear")
            })
            .onDisappear(perform: {
                print("On Disappear")
                title = "View One Again"
            })
            .task(priority: .background) {
                print("task triggered")
                title = await changeTitle()
            }
    }
    
    func changeTitle() async -> String {
        sleep(5)
        return "Async task completed"
    }
}

#Preview {
    FirstTabView()
}
