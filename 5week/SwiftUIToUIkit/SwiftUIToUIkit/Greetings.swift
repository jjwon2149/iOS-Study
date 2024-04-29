//
//  Greetings.swift
//  SwiftUIToUIkit
//
//  Created by 정종원 on 4/24/24.
//

import SwiftUI

struct Greetings: View {
    var textFromUIkit: String
    var body: some View {
        Text("\(textFromUIkit)")
    }
}

#Preview {
    Greetings(textFromUIkit: "Helloworld!")
}
