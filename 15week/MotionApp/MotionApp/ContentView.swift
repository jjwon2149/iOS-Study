//
//  ContentView.swift
//  MotionApp
//
//  Created by 정종원 on 7/3/24.
//

import SwiftUI
import CoreMotion
//가속도의 속도 변화량을 감지함
struct ContentView: View {
    
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
        .padding()
        .onAppear {
            motionManager.startAccelerometerUpdates(to: queue) { (data: CMAccelerometerData?, error: Error?) in
                guard let data = data else {
                    print("error: \(error?.localizedDescription)")
                    return
                }
                
                let trackMotion: CMAcceleration = data.acceleration
                motionManager.accelerometerUpdateInterval = 1 //센서가 예민해서 2.5초 주기로 설정
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
    ContentView()
}
