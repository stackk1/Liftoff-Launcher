//
//  SwiftUIView.swift
//  WeatherAPITest
//
//  Created by Andrew on 2023-06-18.
//

import SwiftUI

struct WeatherIcon: View {
    @EnvironmentObject var wm: WeatherModel
    var condition: Int = 800
    var description: String = "error"

    var body: some View {
        
        VStack (spacing: 0){
            switch condition {
            case 0..<300:
                 Image(systemName: "cloud.bolt.rain")
                    .padding(.bottom, 1)
            case 300..<400:
                 Image(systemName: "cloud.drizzle")
                    .padding(.bottom, 1)
            case 500..<600:
                 Image(systemName: "cloud.rain")
                    .padding(.bottom, 1)
            case 600..<700:
                 Image(systemName: "snowflake")
                    .padding(.bottom, 1)
            case 700..<800:
                 Image(systemName: "smoke")
                    .padding(.bottom, 1)
            case 800:
                 Image(systemName: "sun.max")
                    .padding(.bottom, 1)
            case 800..<900:
                Image(systemName: "cloud")
                    .padding(.bottom, 1)
            default:
                 Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
                    .padding(.bottom, 1)
            }
                
            Text(description)
                .font(.system(size:10))
                .frame(height: 28, alignment: .center)
        }
        .padding(.top, 2)
        
    }
}

struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIcon(condition: 801, description: "testing")
            .environmentObject(WeatherModel())
    }
}
