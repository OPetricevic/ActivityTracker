//
//  ActivityViewModel.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 17.10.2023..
//

// ActivityViewModel.swift

import SwiftUI
import CoreMotion
import CoreLocation

class ActivityViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let pedometer: CMPedometer = CMPedometer()
    private let locationManager = CLLocationManager()

    @Published var steps: Int?
    @Published var distance: Double?
    @Published var userPath: [CLLocationCoordinate2D] = []

    private var isPedometerAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }

    override init() {
        super.init()
        setupLocationManager()
    }

    func initializePedometer() {
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .day, value: -7,  to: Date()) else {
                return
            }
            pedometer.queryPedometerData(from: startDate, to: Date()) {(data, error) in
                guard let data = data, error == nil else { return }

                self.steps = data.numberOfSteps.intValue
                print("\(String(describing: self.steps))")

                if let distance = data.distance?.doubleValue {
                    let distanceInKilometers = distance / 1000

                    let formattedDistance = String(format: "%.2f", distanceInKilometers)

                    print("\(formattedDistance) km")
                    self.distance = Double(formattedDistance)
                }
            }
        }
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates
        guard let latestLocation = locations.last else { return }
        userPath.append(latestLocation.coordinate)
        // Update other data and UI as needed
    }
}
