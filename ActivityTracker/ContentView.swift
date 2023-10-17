//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 14.10.2023..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                ActivityView()
                ActivityView()
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
