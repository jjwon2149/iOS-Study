//
//  ContentView.swift
//  VehicleInformationApp
//
//  Created by 정종원 on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("전기", destination: ElectricCarsView())
                NavigationLink("내연기관", destination: OilCarsView())
                NavigationLink("하이브리드", destination: HybridCarsView())
            }
            .navigationTitle("TopGear")
        }
        .ignoresSafeArea()
    }
}




#Preview {
    ContentView()
}
