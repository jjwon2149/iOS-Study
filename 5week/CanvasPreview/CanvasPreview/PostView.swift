//
//  PostView.swift
//  CanvasPreview
//
//  Created by 정종원 on 4/26/24.
//

import SwiftUI

struct PostView: View {
    
    var title: String
    var text: String
    var imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if geometry.size.height > geometry.size.width { //세로가 긴 경우
                    VStack(spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.75)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                    .padding()
                } else {
                    HStack(spacing: 20) {
                        Image(systemName: imageName)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.55)
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .padding(.top)
                            Text(text)
                                .padding(.top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PostView(title: "Weather forcast", text: "Scattered thunderstroms Potential for heavy rainfall. Low 68. Wind light and variable. Chance of rain 60%" , imageName: "cloud.bolt.rain")
}
