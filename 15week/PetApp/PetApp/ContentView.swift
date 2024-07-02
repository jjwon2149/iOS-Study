//
//  ContentView.swift
//  PetApp
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    
    @State var petName = ""
    @State var petBreed = ""
    @State var petArray = [Animal]()
    
    
    var body: some View {
        VStack {
            TextField("Enter Pet Name", text: $petName)
                .textFieldStyle(.roundedBorder)
            TextField("Enter Pet Breed", text: $petBreed)
                .textFieldStyle(.roundedBorder)

            Button {
                coreDM.savePet(name: petName, breed: petBreed)
                
                petName = ""
                petBreed = ""
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(coreDM: CoreDataManager())
}
