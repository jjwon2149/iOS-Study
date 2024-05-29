//
//  RatingView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/29/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        rating = index + 1
                    }
            }
        }
    }
}

//#Preview {
//    RatingView()
//}
