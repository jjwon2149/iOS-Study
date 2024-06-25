//
//  ContentView.swift
//  WeatherKitProject
//
//  Created by 정종원 on 6/25/24.
//

import SwiftUI
import CoreLocation

/*
 1. 버튼 2개는 바텀업 방식 -> 데이터확인
 2. 탑다운 방식으로 View를 그리고
 3. 데이터 연결하기
 https://www.figma.com/design/9lANvJfMAnJsDyCFMGWAUB/Apple-Weather-App-Clone-(Community)?node-id=105-899
 */

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            
            ScrollView{
                VStack {
                    Text("SeongNam-Si")
                        .font(.system(size: 40))
                    
                    Text("21º")
                        .font(.system(size: 120,weight: .thin))
                    
                    Text("Partly Cloudy")
                        .font(.system(size: 25))
                    HStack {
                        Text("H: 29º")
                        Text("L: 15º")
                    }
                    .font(.system(size: 25))
                    
                    Spacer()
                        .frame(height: 60)
                    Text("Cloudy Conditions from 1AM-9AM, with\nshowers expected at 9AM.")
                        .foregroundStyle(.white)
                    Rectangle()
                        .fill(.white)
                        .frame(height: 0.5)
                    ScrollView(.horizontal){
                        LazyHStack {
                            ForEach(0 ..< 11) { index in
                                VStack(alignment: .center) {
                                    Text("\(index)PM")
                                    Spacer()
                                    Image(systemName: "cloud.fill")
                                        .font(.largeTitle)
                                    Spacer()
                                    Text("21º")
                                        .font(.system(size: 21, weight: .semibold))
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Spacer()
                        .frame(height: 40)
                    
                    Section {
                        ForEach(0 ..< 11) { _ in
                            VStack {
                                HStack {
                                    Text("test")
                                    Image(systemName: "sun.max.fill")
                                        .renderingMode(.original)
                                    Text("21º")
                                        .foregroundStyle(.gray)
                                    ProgressView(value: 0.5)
                                        .tint(.orange)
                                    Text("25º")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(2)
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                    } header: {
                        HStack {
                            Label("10-Day FORCAST", systemImage: "calendar")
                            
                            Spacer()
                        }
                        Rectangle()
                            .fill(.white)
                            .frame(height: 0.5)
                    }
                }
                .foregroundStyle(.white)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
