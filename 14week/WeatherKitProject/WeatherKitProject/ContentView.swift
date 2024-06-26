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
            Color.black.edgesIgnoringSafeArea(.all)
            GeometryReader { proxy in
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
            }
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        CardView(title: "TEST") {
                            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            
                        }
                        
                        CardView(title: "TEST1") {
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(0..<10) { index in
                                        VStack {
                                            Text("\(index)PM")
                                            Spacer()
                                            Image(systemName: "cloud.fill")
                                                .font(.largeTitle)
                                            Spacer()
                                            Text("21°")
                                                .font(.system(size: 21, weight: .semibold))
                                        }
                                    }
                                }
                            }
                            .frame(height: 120)
                        }
                        
                        
                        HStack {
                            Label("10-DAY FORCAST", systemImage: "calendar")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CardView(title: "TEST2") {
                            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            
                        }
                        
                        VStack(alignment: .leading) {
                            ForEach(0..<100) { index in
                                VStack {
                                    HStack {
                                        Text("Mon")
                                        Image(systemName: "sun.max.fill")
                                        Text("15°")
                                            .foregroundStyle(.gray)
                                        ProgressView(value: 0.5)
                                            .tint(Color.orange)
                                        Text("29°")
                                    }
                                }
                                .padding(4)
                                .font(.system(size: 21, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                    } header: {
                        HeaderView()
                            .padding(.bottom, 20)
                    }
                }
                .foregroundStyle(.white)
                .padding()
            }
        }
    }
}

//MARK: - HeaderView
struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Seongnam-si")
                .font(.system(size: 40))
            Text("21°")
                .font(.system(size: 110, weight: .thin))
            Text("Partly Cloudy")
                .font(.system(size: 25))
            HStack {
                Text("H:29°")
                Text("L:15°")
            }
            .font(.system(size: 23))
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
    }
}

//MARK: - ScrollOffsetKey
struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//MARK: - CardView
struct CardView<Content: View>: View {
    var title: String
    
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .global).minY)
                    .onAppear {
                        self.scrollOffset = proxy.frame(in: .global).minY
                    }
                    .onChange(of: proxy.frame(in: .global).minY) { old, newValue in
                        self.scrollOffset = newValue
                        print("\(title) changed by: \(newValue)")
                    }
            }
            .frame(height: 0)
            Text(title)
                .font(.title)
                .bold()
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .opacity(scrollOffset < 250 ? 0 : min(1,((scrollOffset - 250) / 250.0)))
        .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
