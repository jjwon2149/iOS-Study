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
                    
                    Button(action: {
                    }) {
                        Text("검색")
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

#Preview {
    ContentView()
}
