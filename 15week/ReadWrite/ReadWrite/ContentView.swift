//
//  ContentView.swift
//  ReadWrite
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var createText = ""
    @State var displayText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $createText)
            
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
