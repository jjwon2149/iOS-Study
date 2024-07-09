//
//  ContentView.swift
//  GuardApp
//
//  Created by 정종원 on 7/9/24.
//

import SwiftUI

struct ContentView: View {

    @State var showImage: UIImage = UIImage(systemName: "photo")!

    var body: some View {
        VStack {
            Image(uiImage: showImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
            Button {
                getImage("zzz") //없는 이미지 파일이 들어갈 경우
            } label: {
                Text("Add Picture")
            }
        }
        .padding()
    }

    func getImage(_ imageName: String) {
//        //전통적인 방식
//        if UIImage(named: imageName) != nil {
//            showImage = UIImage(named: imageName)!
//        } else {
//            showImage = UIImage(systemName: "xmark.octagon.fill")!
//        }
        
        //guard 사용
        guard UIImage(named: imageName) != nil else {
            showImage = UIImage(systemName: "xmark.octagon.fill")!
            return
        }
        showImage = UIImage(named: imageName)!
    }
}

#Preview {
    ContentView()
}
