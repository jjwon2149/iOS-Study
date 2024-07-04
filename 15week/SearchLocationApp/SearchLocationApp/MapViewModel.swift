//
//  MapViewModel.swift
//  SearchLocationApp
//
//  Created by 정종원 on 7/4/24.
//

import SwiftUI
import MapKit

@Observable
class MapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var searchText: String = ""
    var mapStyle: MapStyle = .standard
}
