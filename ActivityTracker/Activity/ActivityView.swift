//
//  ActivityView.swift
//  ActivityTracker
//
//  Created by Omar Petričević on 17.10.2023..
//

import SwiftUI

struct ActivityView : View {
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(10)
            VStack(spacing: 15){
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 5 ){
                        Text("Daily Steps")
                            .font(.system(size: 16))
                        
                        Text("Goal: 10,000 Steps")
                            .font(.system(size: 12))
                    }
                    Spacer()
                    
                    Image(systemName: "figure.walk")
                        .foregroundColor(.green)
                }
                
                Text("5,251")
                    .font(.system(size: 20))
            }.padding()
            .cornerRadius(15)
        }
        
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
