//
//  CarDetailView.swift
//  Bae-VehicleInformation
//
//  Created by 정종원 on 4/16/24.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(car.modelName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(car.getDetails())
                .font(.body)
        }
        .padding()
        .navigationTitle(car.modelName)
    }
}
