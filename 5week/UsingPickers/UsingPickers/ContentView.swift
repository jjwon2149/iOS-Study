//
//  ContentView.swift
//  UsingPickers
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var choice = 0
    @State private var showText = false
    @State private var transitMode = ["Bike", "Car", "Bus"]
    @State private var sliderVal: Float = 0
    @State private var gameTime = Date()
    var body: some View {
        Form {
            Section {
                Picker("Transit Modes", selection: $choice) {
                    ForEach( 0 ..< transitMode.count, id: \.self) { index in
                        Text("\(transitMode[index])")
                    }
                }
                .pickerStyle(.segmented)
                
                Text("Current Choice: \(transitMode[choice])")
            }
            
            Section {
                Toggle(isOn: $showText) {
                    Text("Show Text")
                }
                if showText {
                    Text("The Text toggle is on")
                }
            }
            
            Section {
                Slider(value: $sliderVal, in: 0...10, step: 0.0001)
                Text("Slider Current Value \(sliderVal, specifier: "%.2f")")
            }
        }
    }
}

#Preview {
    ContentView()
}
