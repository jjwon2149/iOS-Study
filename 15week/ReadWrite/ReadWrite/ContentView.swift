//
//  ContentView.swift
//  ReadWrite
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    let placeHolder = "텍스트를 입력하세요."
    @State var createText = "텍스트를 입력하세요."
    @State var displayText = ""
    @FocusState var textFieldFocus: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $createText)
                .foregroundStyle(placeHolder == createText ? .gray : .black)
                .focused($textFieldFocus)
                .onChange(of: textFieldFocus) {
                    // 텍스트 필드에 포커스 이동시 플레이스 홀더가 표시되어 있으면, 입력텍스트 필드 입력 대기상태로 만듬
                    if textFieldFocus, placeHolder == createText {
                        createText = ""
                        
                        
                    } else if !textFieldFocus, createText.isEmpty {
                        createText = placeHolder
                    }
                }
            
            HStack {
                Button {
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.text") //  ~~~/file.text 만들어줌
                    do {
                        try createText.write(to: url!, atomically: true, encoding: .utf8)
                    } catch {
                        print("File Writing Error")
                    }
                } label: {
                    Text("Write File")
                }
                
                Button {
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.text") //  ~~~/file.text 만들어줌
                    do {
                        let fileContent = try String(contentsOf: url!, encoding: .utf8)
                        displayText = fileContent
                    } catch {
                        print("File Reading Error")
                    }
                } label: {
                    Text("Read File")
                }
            }
            .padding()
            
            TextEditor(text: $displayText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
