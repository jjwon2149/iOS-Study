//
//  OilCarsView.swift
//  VehicleInformationApp
//
//  Created by 정종원 on 4/16/24.
//

import SwiftUI

struct OilCarsView: View {
    @StateObject var oilCars = CarData()

    var body: some View {
        List([oilCars.kiaK5, oilCars.kiaK8, oilCars.kiaK9]) { car in
            VStack(alignment: .leading) {
                Text("\(car.brand)")
                    .font(.subheadline)
                Text("\(car.modelName)")
                    .font(.title)
                Text("\(car.isAutomaticString)")
                    .font(.subheadline)
                Text("\(car.isGasolineString)")
                    .font(.subheadline)
                Text(String(format: "연비 %.2fkm/h", car.fuelEfficiency))
                    .font(.subheadline)
            }
        }
        .navigationBarTitle("내연 기관")
    }
}

#Preview {
    OilCarsView()
}
