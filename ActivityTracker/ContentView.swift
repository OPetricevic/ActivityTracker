//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 14.10.2023..
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activityViewModel = ActivityViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                ActivitySummaryView(title: "Steps Last 7 Days",
                                    goal: "Goal: 50,000 Steps",
                                    iconName: "figure.walk",
                                    value: activityViewModel.steps.map { "\($0)" })
                ActivitySummaryView(title: "Distance Crossed Last 7 Days",
                                    goal: "Goal: 25km",
                                    iconName: "figure.walk",
                                    value: activityViewModel.distance.map { "\($0)km" })
                
            }
            .onAppear {
                activityViewModel.initializePedometer()
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
