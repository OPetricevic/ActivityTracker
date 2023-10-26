//
//  ActivityTracker
//
//  Created by Omar Petričević on 23.10.2023..
//

import SwiftUI


struct ActivityDashboardView: View {
    
    @ObservedObject var activityViewModel = ActivityViewModel()
    
    var body: some View {
        NavigationView{
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
                    ActivitySummaryView(title: "Workouts",
                                        goal: "Three Day's a Week",
                                        iconName: "dumbbell")
                    MapView(viewModel: activityViewModel)
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 150)
                    
                    
                }
                .onAppear {
                    activityViewModel.initializePedometer()
                }.padding(.horizontal)
                
                HStack(spacing: 12){
                    
                    Button(action: {
                        activityViewModel.startStopTracking()
                    }) {
                        Text(activityViewModel.isTracking ? "Stop Tracking" : "Start Tracking")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                }
                .padding(.horizontal)
            }.navigationTitle("Dashboard")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDashboardView()
    }
}
