//
//  AudioPlayerManager.swift
//  AudioApp
//
//  Created by 정종원 on 7/5/24.
//

import AVFoundation

class AudioPlayerManager {
    var audioPlayr: AVAudioPlayer?
    
    func loadAudio(name fileName: String, withExtension ext: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            print("Audio File not Found")
            return
        }
        
        do {
            audioPlayr = try AVAudioPlayer(contentsOf: url)
            audioPlayr?.prepareToPlay()
        } catch {
            print("Error loading audio: \(error.localizedDescription)")
        }
    }
    
    func play() {
        audioPlayr?.play()
    }
    
    func pause() {
        audioPlayr?.pause()
    }
    
    func stop() {
        audioPlayr?.stop()
        audioPlayr?.currentTime = 0
    }
    
}
