//
//  MapView.swift
//  JRNL-SwiftUI
//
//  Created by 정종원 on 5/28/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct mapUIView: UIViewRepresentable {
    
    
    @Binding var region: MKCoordinateRegion
    @Binding var annotations: [MKAnnotation]
    @Binding var journalEntry: JournalEntry?
    @Binding var isDetailViewActive: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.addAnnotations(annotations)
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: mapUIView
        init(_ parent: mapUIView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
            return nil
        }
    }
    
}

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4149),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var annotations: [MKAnnotation] = []
    @State private var journalEntry: JournalEntry?
    @State private var isDetailViewActive = false
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            mapUIView(region: $region, annotations: $annotations, journalEntry: $journalEntry, isDetailViewActive: $isDetailViewActive)
                .onAppear {
                    locationManager.requestLocation()
                }
                .onReceive(locationManager.$location) { location in
                    if let location = location {
                        region = MKCoordinateRegion(center: location.coordinate,
                                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                        annotations = []
                    }
                }
                .navigationTitle("Map")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapView()
}
