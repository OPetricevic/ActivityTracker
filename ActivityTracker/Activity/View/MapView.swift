//
//  MapView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 18.10.2023..
//

import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    @ObservedObject var viewModel: ActivityViewModel

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Remove previous overlays
        uiView.removeOverlays(uiView.overlays)

        // Add a polyline overlay for the user's path
        let polyline = MKPolyline(coordinates: viewModel.userPath, count: viewModel.userPath.count)
        uiView.addOverlay(polyline)

        // Set the region based on user's location
        if let userCoordinate = viewModel.userPath.last {
            setRegion(for: uiView, coordinate: userCoordinate)
        }
    }

    private func setRegion(for mapView: MKMapView, coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        mapView.setRegion(region, animated: true)
    }
}

