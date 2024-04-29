//
//  ContentView.swift
//  StackList
//
//  Created by 정종원 on 4/24/24.
//

import SwiftUI


struct ContentView: View {
    var weatherData: [WeatherInfo]
    var body: some View {
        List {
            ForEach(weatherData) { weather in
                HStack {
                    Image(systemName: weather.image)
                        .frame(width: 50, alignment: .leading)
                    Text("\(weather.temp)°F")
                        .frame(width: 80, alignment: .leading)
                    Text(weather.city)
                }
                .font(.system(size: 25))
                .padding()
                WeatherRow(weather: weather)
            }
        }
    }
}

#Preview {
    ContentView(weatherData: WeatherInfo.weatherData)
}
