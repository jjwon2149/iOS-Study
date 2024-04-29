//
//  ContentView.swift
//  Calculator
//
//  Created by 정종원 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var calculatorTextField = ""
    
    let buttons = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", ".", "/", "+"]
        ]
    
    var body: some View {
        VStack {
            TextField("숫자", text: $calculatorTextField)
            
            VStack {
                HStack{
                    
                }
                HStack{
                    
                }
                HStack{
                    
                }
                HStack{
                    
                }
                Button {
                    
                } label: {
                    Text("=")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
