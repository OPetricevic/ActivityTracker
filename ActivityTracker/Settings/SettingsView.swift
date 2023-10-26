//
//  SettingsView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 23.10.2023..
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("SettingsTest")
            }
            .navigationTitle("Settings")
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
