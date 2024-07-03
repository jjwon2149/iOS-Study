//
//  DeviceMotionView.swift
//  MotionApp
//
//  Created by 정종원 on 7/3/24.
//

import SwiftUI
import CoreMotion

struct DeviceMotionView: View {
    @State private var pitch: Double = 0.0
    @State private var yaw: Double = 0.0
    @State private var roll: Double = 0.0
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    var body: some View {
        VStack {
            Text("Pitch \(pitch)")
            Text("Yaw \(yaw)")
            Text("Roll \(roll)")
        }
        .onAppear {
            motionManager.startDeviceMotionUpdates(to: queue) { (data: CMDeviceMotion?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error)")
                    return
                }
                
                let trackMotion: CMAttitude = data.attitude
                motionManager.gyroUpdateInterval = 0.5
                DispatchQueue.main.async {
                    pitch = trackMotion.pitch
                    yaw = trackMotion.yaw
                    roll = trackMotion.roll
                }
            }
        }
    }
}

#Preview {
    DeviceMotionView()
}
