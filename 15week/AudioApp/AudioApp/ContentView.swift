//
//  ContentView.swift
//  AudioApp
//
//  Created by 정종원 on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var playAudio = false
    
    var audioPlayerManager = AudioPlayerManager()
    
    var body: some View {
        VStack {
            Button {
                if !playAudio {
                    audioPlayerManager.play()
                } else {
                    audioPlayerManager.pause()
                }
                playAudio.toggle()
            } label: {
                Text(playAudio ? "PlayAudio" : "StopAudio")
            }
        }
        .padding()
        .onAppear {
            audioPlayerManager.loadAudio(name: "Small World", withExtension: "mp3")
        }
    }
}

#Preview {
    ContentView()
}
