//
//  ContentView.swift
//  SearchApp
//
//  Created by 정종원 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    
    let petArray = ["Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog"]
    
    var body: some View {
        NavigationStack {
            PetListView(animals: petArray)
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Look for a pet") {
            Text("Singing").searchCompletion("Canary")
            Text("Croaking").searchCompletion("Fish")
            Text("Grumpy").searchCompletion("Donkey")
            
            Divider()
            ForEach(petArray.filter { !searchText.isEmpty && $0.hasPrefix(searchText) }, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct PetListView: View {
    let animals: [String]
    var body: some View {
        List(animals, id: \.self) { animal in
            Text(animal)
        }
    }
}


#Preview {
    ContentView()
}
