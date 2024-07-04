//
//  ContentView.swift
//  SearchLocationApp
//
//  Created by 정종원 on 7/4/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var viewModel = MapViewModel()
    @State var style = 0
    
    var body: some View {
        NavigationStack {
            Map(position: $viewModel.cameraPosition)
                .mapStyle(viewModel.mapStyle)
                .navigationTitle("Search Location")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText)
                .searchScopes($style) {
                    Text("Standard").tag(0)
                    Text("Imagery").tag(1)
                    Text("Hybrid").tag(2)
                }
                .onChange(of: style) {
                    switch style {
                    case 0:
                        viewModel.mapStyle = .standard
                    case 1:
                        viewModel.mapStyle = .imagery
                    case 2:
                        viewModel.mapStyle = .hybrid
                    default:
                        viewModel.mapStyle = .standard
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}