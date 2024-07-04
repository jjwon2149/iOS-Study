import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State var searchText = ""
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $region,
                showsUserLocation: true)
            .onAppear {
                if let mapRegion = locationManager.mapRegion {
                    region = MKCoordinateRegion(center: mapRegion.center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    print(mapRegion.center)
                }
            }

            
        }
        .padding()
        .searchable(text: $searchText)

    }
}

//MARK: - LocationManager
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var mapRegion: MKCoordinateRegion? = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var binding: Binding<MKCoordinateRegion> {
            Binding {
                self.mapRegion ?? MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            } set: { newRegion in
                self.mapRegion = newRegion
            }
        }

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            DispatchQueue.main.async {
                self.mapRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }
    }
}

#Preview {
    ContentView()
}
