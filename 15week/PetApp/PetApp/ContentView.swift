//
//  ContentView.swift
//  PetApp
//
//  Created by 정종원 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var petName = ""
    @State var petBreed = ""
    @State var petArray = [Animal]()
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Animal.name, ascending: true)], animation: .default)
    
    private var animals: FetchedResults<Animal>
    
    var body: some View {
        VStack {
            TextField("Enter Pet Name", text: $petName)
                .textFieldStyle(.roundedBorder)
            TextField("Enter Pet Breed", text: $petBreed)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                let pet = Animal(context: viewContext)
                pet.name = petName
                pet.breed = petBreed
                do {
                    try viewContext.save()
                } catch {
                    
                }
                petName = ""
                petBreed = ""
            }
            
            List {
                ForEach(animals, id: \.self) { pet in
                    VStack {
                        Text(pet.name ?? "")
                        Text(pet.breed ?? "")
                    }
                }

            }
        }
        .padding()
    }
}
