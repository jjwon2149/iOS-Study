//
//  EditButtonView.swift
//  Buttons
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI

struct EditButtonView: View {
    @State var animals = ["Cats", "Dogs", "Goats"]
    var body: some View {
        List {
            ForEach(animals, id: \.self) {animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("Edit Button View")
    }
    
    func removeAnimal(at offsets: IndexSet) {
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack{
        EditButtonView()
    }
}
