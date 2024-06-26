//
//  Car.swift
//  VehicleInformationApp
//
//  Created by 정종원 on 4/16/24.
//

import Foundation

protocol Fuel {
    var fuelEfficiency: Double { get set } // 연비
    var isGasoline: Bool  { get set } // 가솔린일까 디젤일까
    var fuelEfficiencyString: String { get }
    var isGasolineString: String  { get }
}

extension Fuel {
    var fuelEfficiencyString: String {
        String(format: "%.2f", fuelEfficiency)
    }
    var isGasolineString: String {
        isGasoline ? "가솔린" : "디젤"
    }
}

protocol Electric {
    var electricEfficiency: Double { get set }
    var fullChargeHours: Double { get set }
    var autoLevel: Int { get set }
}

class Car: Identifiable {
    
    var brand: String
    var modelName: String
    var year: Int
    
    var doorCount: Int
    var weight: Int
    var height: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int) {
        self.brand = brand
        self.modelName = modelName
        self.year = year
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
    }
    
}

class ElectricCar: Car, Electric {
    
    var electricEfficiency: Double
    var fullChargeHours: Double
    var autoLevel: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, electricEfficiency: Double, fullChargeHours: Double, autoLevel: Int) {
        self.electricEfficiency = electricEfficiency
        self.fullChargeHours = fullChargeHours
        self.autoLevel = autoLevel
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
}

class OilCar: Car, Fuel {
    
    var isAutomatic: Bool
    var fuelEfficiency: Double
    var isGasoline: Bool
    
    var isAutomaticString: String {
        isAutomatic ? "자동변속" : "수동변속"
    }
    
    //
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, isAutomatic: Bool, fuelEfficiency: Double, isGasoline: Bool) {
        self.isAutomatic = isAutomatic
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
}

class HybridCar: Car, Fuel, Electric {

    var fuelEfficiency: Double
    var isGasoline: Bool
    var autoLevel: Int
    
    var electricEfficiency: Double
    var fullChargeHours: Double
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, fuelEfficiency: Double, isGasoline: Bool, autoLevel: Int, electricEfficiency: Double = 0.0, fullChargeHours: Double = 0.0) {
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        self.autoLevel = autoLevel
        self.electricEfficiency = isGasoline ? 0.0 : electricEfficiency
        self.fullChargeHours = isGasoline ? 0.0 : fullChargeHours
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
}

