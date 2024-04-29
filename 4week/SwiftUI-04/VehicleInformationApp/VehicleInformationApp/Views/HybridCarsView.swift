//
//  HybridCarsView.swift
//  VehicleInformationApp
//
//  Created by 정종원 on 4/16/24.
//

import SwiftUI

struct HybridCarsView: View {
    @StateObject var hybridCars = CarData()

    var body: some View {
        List([hybridCars.prius, hybridCars.grandeurHybrid]) { car in
            VStack(alignment: .leading) {
                Text("\(car.brand)")
                    .font(.subheadline)
                Text("\(car.modelName)")
                    .font(.title)
                Text("\(car.isGasolineString)")
                    .font(.subheadline)
                Text(String(format: "연비 %.2fkm/h", car.fuelEfficiency))
                    .font(.subheadline)
                Text("자율주행 \(car.autoLevel)단계")
            }
        }
        .navigationBarTitle("하이브리드")
    }
        
}

#Preview {
    HybridCarsView()
}
