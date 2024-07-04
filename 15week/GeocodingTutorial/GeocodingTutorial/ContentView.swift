import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @State var searchText = ""
    let searchRoute = ""
    //    @State private var route: MKRoute?
    
    @State var route: [CLLocationCoordinate2D] = [
        //        CLLocationCoordinate2D(latitude: 37.785834,longitude: -122.406417)
    ]
    let strokeStyle = StrokeStyle(
        lineWidth: 3,
        lineCap: .round,
        lineJoin: .round,
        dash: [5, 5]
    )
    
    let gradient = Gradient(colors: [.red, .green, .blue])
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("장소 검색", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        reverseGeocoding(to: searchText) { result in
                            if let result = result {
                                route.append(locationManager.location!)
                                route.append(result)
                            }
                        }
                    } label: {
                        Text("검색")
                    }
                    Button {
                        route.removeLast()
                        route.removeLast()
                    } label: {
                        Text("루트 삭제")
                    }
                }
                Map {
                    if let location = locationManager.location {
                        Marker("Current Aea", coordinate: location)
                            .tint(.blue)
                    }
                    MapPolyline(coordinates: route)
                        .stroke(gradient, style: strokeStyle)
                    
                }
                
                
            }
            .padding()
            .navigationTitle("MapTutorial")
            .navigationBarTitleDisplayMode(.inline)
        } //NavigationStack
    }
    
    func reverseGeocoding(to place: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(place) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                completion(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - LocationManager
    class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
        let manager = CLLocationManager()
        
        @Published var location: CLLocationCoordinate2D?
        
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
                    self.location = locations.first?.coordinate
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
