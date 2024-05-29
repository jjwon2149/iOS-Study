//
//  AddJournalEntryView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI
import CoreLocation


struct AddJournalEntryView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var isGetLocationOn = false
    @State private var entryTitle = ""
    @State private var entryBody = ""
    @State private var locationLabel = "Get Location"
    @State private var currentLocation: CLLocation?
    @State private var rating = 0
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("Rating")) {
                    Rectangle()
                        RatingView(rating: $rating)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Section(header: Text("Location")) {
                    Toggle(locationLabel, isOn: $isGetLocationOn)
                        .onChange(of: isGetLocationOn) {
                            if isGetLocationOn {
                                locationLabel = "Get Location..."
                                locationManager.requestLocation()
                            } else {
                                locationLabel = "Get Location"
                            }
                        }
                        .onReceive(locationManager.$location) { location in
                            if isGetLocationOn {
                                currentLocation = location
                                locationLabel = "Done"
                            }
                        }
                }
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $entryTitle)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $entryBody)
                }
                Section(header: Text("Photo")) {
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("Add Journal Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let journalEntry = JournalEntry(rating: 3, entryTitle: entryTitle, entryBody: entryBody, latitude: currentLocation?.coordinate.latitude, longitude: currentLocation?.coordinate.longitude)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddJournalEntryView()
}
