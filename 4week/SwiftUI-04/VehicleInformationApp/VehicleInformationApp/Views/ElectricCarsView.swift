//
//  ElectricCarsView.swift
//  VehicleInformationApp
//
//  Created by 정종원 on 4/16/24.
//

import SwiftUI

struct ElectricCarsView: View {
    @StateObject var electricCars = CarData()
    
    var body: some View {
        List([electricCars.teslaModelX, electricCars.teslaModelY]) { car in
            VStack(alignment: .leading) {
                Text("\(car.brand)")
                    .font(.headline)
                Text("\(car.modelName)")
                    .font(.title)
                Text(String(format: "효율 %.2fkm/h", car.electricEfficiency))
                    .font(.subheadline)
                Text("충전시간 \(Int(car.fullChargeHours))시간")
                    .font(.subheadline)
                Text("자율 주행 \(car.autoLevel)단계")
                    .font(.subheadline)
            }
        }
        .navigationBarTitle("전기")
    }
}

#Preview {
    ElectricCarsView()
}
