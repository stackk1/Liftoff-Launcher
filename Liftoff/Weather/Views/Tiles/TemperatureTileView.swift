//
//  TemperatureWeatherTile.swift
//  X
//
//  Created by AndrewStack on 2023-07-21.
//

import SwiftUI

struct TemperatureTileView: View {
    @EnvironmentObject var wm: WeatherModel
    @EnvironmentObject var wp: ThemeService
    
    // var title: String
    
    var body: some View {
        let cornerRadius:CGFloat = 20
        ZStack{
            Rectangle()
                .cornerRadius(cornerRadius)
                .foregroundStyle(ColorService.randomGradient(Palette: wp.theme, opac: {
                    if wp.transparancy >= 0.5 {
                        return 0.5
                    }
                    else {
                        return wp.transparancy
                    }
                }()))
                .frame(width:180, height: 180)
            VStack(spacing: 10){
                
                HStack{
                    Image(systemName: "thermometer.sun.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Feels Like")
                            .fontWeight(.bold)
                        Text(String("\(wm.hourlyWeather[1].feels_like)°\(wm.tempUnit)"))
                        
                    }
                }
                HStack{
                    Image(systemName: "sunset.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Temperature")
                            .fontWeight(.bold)
                        Text(String("\(wm.hourlyWeather[1].temp)°\(wm.tempUnit)"))
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
