//
//  ContentView.swift
//  VideoApp
//
//  Created by 정종원 on 7/5/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var player: AVPlayer?
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 320)
                .onAppear {
                    guard let videoURL = Bundle.main.url(forResource: "SaturnV", withExtension: "mov") else {
                        print("Video file not found")
                        return
                    }
                    player = AVPlayer(url: videoURL as URL)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
