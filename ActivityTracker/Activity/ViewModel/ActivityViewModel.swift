//
//  ActivityViewModel.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 17.10.2023..
//

import SwiftUI
import CoreMotion

class ActivityViewModel: ObservableObject{
    
    private let pedometer: CMPedometer = CMPedometer()

    @Published var steps: Int?
    
    private var isPedometerAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    
    func initializePedometer(){
        if isPedometerAvailable{
            guard let startDate = Calendar.current.date(byAdding: .day, value: -1,  to: Date()) else {
                return
            }
            pedometer.queryPedometerData(from: startDate, to: Date()) {(data, error) in
                guard let data = data, error == nil else {return}
                
                self.steps = data.numberOfSteps.intValue
                print("\(String(describing: self.steps))")
                
            }
        }
    }
}
