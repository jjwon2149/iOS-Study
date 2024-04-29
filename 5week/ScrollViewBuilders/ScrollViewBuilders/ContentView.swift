//
//  ContentView.swift
//  ScrollViewBuilders
//
//  Created by 정종원 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scrolledID: CharacterInfo.ID?
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
               Text("iOS 17 +")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    Button {
                        scrolledID = 16

                    } label: {
                        Text("GO to letter Q")
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                    
                    ForEach(CharacterInfo.charArray, id: \.id) { image in
                        Image(systemName: "\(image.name)")
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .frame(width: 90, height: 90)
                            .background(.yellow)
                            .padding()
                    }
                    
                    Button {
                        withAnimation {
                            scrolledID = 6
                        }
                    } label: {
                        Text("Go to lertter G")
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                    
                }
                .scrollPosition(id: $scrolledID)
                
            }
            
            VStack {
               Text("iOS 14 +")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    ScrollViewReader { proxy in
                        Button {
                            proxy.scrollTo(16)

                        } label: {
                            Text("GO to letter Q")
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                        
                        ForEach(CharacterInfo.charArray, id: \.id) { image in
                            Image(systemName: "\(image.name)")
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                                .frame(width: 90, height: 90)
                                .background(.blue)
                                .padding()
                        }
                        
                        Button {
                            withAnimation {
                                proxy.scrollTo(6, anchor: .top)
                            }
                        } label: {
                            Text("Go to lertter G")
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
