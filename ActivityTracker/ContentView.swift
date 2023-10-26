//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 14.10.2023..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            ActivityDashboardView()
            .tabItem {
                Label("Activity", systemImage: "figure.run.square.stack")
            }
          AddWorkoutView()
            .tabItem {
                Label("Add Workout", systemImage: "plus.square.fill")
            }

            SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
