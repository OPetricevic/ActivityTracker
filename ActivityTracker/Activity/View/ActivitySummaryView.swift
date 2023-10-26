//
//  ActivityView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 17.10.2023..
//

import SwiftUI

struct ActivitySummaryView: View {
    var title: String
    var goal: String
    var iconName: String
    var value: String?

    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(10)
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(title)
                            .font(.system(size: 16))

                        Text(goal)
                            .font(.system(size: 12))
                    }
                    Spacer()

                    Image(systemName: iconName)
                        .foregroundColor(.green)
                }

                if let value = value {
                    Text("\(value)")
                        .font(.system(size: 20))
                } else {
                    Text("Loading...") 
                        .font(.system(size: 20))
                }
            }
            .padding()
            .cornerRadius(15)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySummaryView(title: "Steps Last 7 Days", goal: "10,000", iconName: "figure.walk")
    }
}
