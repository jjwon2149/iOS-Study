//
//  SecondView.swift
//  ObservableDemo
//
//  Created by 정종원 on 4/19/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Timer Count \(timerData.timeCount)")
                .font(.headline)
        }
    }
}

#Preview {
    SecondView()
        .environmentObject(TimerData())
}
