//
//  RotationView.swift
//  MotionApp
//
//  Created by 정종원 on 7/3/24.
//

import SwiftUI
import CoreMotion

struct RotationView: View {
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    var body: some View {
        VStack {
            Text("x \(x)")
            Text("y \(y)")
            Text("z \(z)")
        }
        .onAppear {
            motionManager.startGyroUpdates(to: queue) { (data: CMGyroData?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error)")
                    return
                }
                
                let trackMotion: CMRotationRate = data.rotationRate
                motionManager.gyroUpdateInterval = 0.5
                DispatchQueue.main.async {
                    x = trackMotion.x
                    y = trackMotion.y
                    z = trackMotion.z
                }
            }
        }
    }
}

#Preview {
    RotationView()
}