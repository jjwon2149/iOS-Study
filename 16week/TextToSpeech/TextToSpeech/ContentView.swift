//
//  ContentView.swift
//  TextToSpeech
//
//  Created by 정종원 on 7/8/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let audio = AVSpeechSynthesizer()
    
    @State var convertText = AVSpeechUtterance(string: "")
    @State var textToRoad  = "ㄹㅇㅋㅋ 나루토대 사스케 싸움 실화냐 미안 이거보여줄려고 어그로 끌었다"
    @State var sliderValue: Float = 0.0
    var body: some View {
        VStack {
            TextEditor(text: $textToRoad)
                .frame(width: 250, height: 200)
            Slider(value: $sliderValue, in: 0...1)
            Button {
                convertText = AVSpeechUtterance(string: textToRoad)
                convertText.rate = sliderValue
                audio.speak(convertText)
            } label: {
                Text("Road Test Out Load")
            }
        }
    }
}

#Preview {
    ContentView()
}
