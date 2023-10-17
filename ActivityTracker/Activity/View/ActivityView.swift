//
//  ActivityView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 17.10.2023..
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject private var activityViewModel = ActivityViewModel()
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(10)
            
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Daily Steps")
                            .font(.system(size: 16))
                        
                        Text("Goal: 10,000 Steps")
                            .font(.system(size: 12))
                    }
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                        .foregroundColor(.green)
                }
                
                if let steps = activityViewModel.steps {
                    Text("\(steps)")
                        .font(.system(size: 20))
                } else {
                    Text("Loading...") // You might want to handle loading state here
                        .font(.system(size: 20))
                }
            }
            .padding()
            .cornerRadius(15)
        }
        .onAppear {
            activityViewModel.initializePedometer()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
