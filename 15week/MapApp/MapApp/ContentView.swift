//
//  ContentView.swift
//  MapApp
//
//  Created by 정종원 on 7/4/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let paris = CLLocationCoordinate2D(latitude: 48.856613, longitude: 2.352222)
}

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}

struct ContentView: View {
    let locationManager = CLLocationManager()
    
    @State var message = "Map of Paris"
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(center: .paris, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: .paris, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let place = IdentifiablePlace(lat: 48.856613, long: 2.352222)
    
    var body: some View {
        VStack {
            // iOS 17 이전 코드
            Map(coordinateRegion: $region,
                annotationItems: [place]) { place in
                MapMarker(coordinate: place.location,
                          tint: Color.purple)
            }
            // iOS 17 이후 코드
            Map(position: $position) {
                Annotation("에펠탑", coordinate: .paris) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(.purple)
                        .background(.white)
                        .clipShape(Circle())
                }
            }
            TextEditor(text: $message)
                .frame(width: .infinity, height: 100)
        }
        .onAppear {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

#Preview {
    ContentView()
}
