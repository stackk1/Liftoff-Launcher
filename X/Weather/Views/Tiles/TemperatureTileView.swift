//
//  TemperatureWeatherTile.swift
//  X
//
//  Created by AndrewStack on 2023-07-21.
//

import SwiftUI

struct TemperatureTileView: View {
    @EnvironmentObject var wm: WeatherModel
    @EnvironmentObject var wp: WPService
    
    // var title: String
    
    var body: some View {
        let cornerRadius:CGFloat = 20
        ZStack{
            Rectangle()
                .cornerRadius(cornerRadius)
                .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)))
                .frame(width:180, height: 180)
            VStack(spacing: 10){
                
                HStack{
                    Image(systemName: "thermometer.sun.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Feels Like")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].feels_like))
                        
                    }
                }
                HStack{
                    Image(systemName: "sunset.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Temperature")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].temp))
                    }
                }
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}
struct TemperatureTileView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureTileView()
    }
}
