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
                    
                } label: {
                    Text("Write File")
                }
                
                Button {
                    
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
