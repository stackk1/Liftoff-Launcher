//
//  WeatherView.swift
//  X
//
//  Created by Andrew on 2023-06-08.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var wm: WeatherModel
    @EnvironmentObject var wp: WPService
   

    var body: some View {
        let themeColour = wp.setIconColor()
        VStack(alignment: .leading){
            HStack {
                VStack(alignment: .leading){
                    Text("\(wm.city) Weather")
                        .fontWeight(.semibold)
                    Text("Current Temp: \(wm.formatPrecision(temp: wm.currentTemp))°\(wm.tempUnit)")
                        .font(.caption)
                    Text("Feels Like: \(wm.formatPrecision(temp:wm.feelTemp, places:0))°\(wm.tempUnit)")
                        .font(.caption)
                }
                Spacer()
                Button(action: {
// REFRESH BUTTON
                    wm.updateLocation(city: wm.city)
                    wm.updateTempUnits(units: wm.weatherUnits)
                    wm.fetchWeather()
                    wm.refreshWeather()
                }, label: {Image(systemName: "arrow.counterclockwise.icloud.fill").imageScale(.large)})
                    .padding(.trailing)
            }
           .padding(.bottom, 3)

            Grid(alignment: .center, horizontalSpacing: 15, verticalSpacing: 0){
                // Days of the week
                GridRow{
                    Text("Today")
                        .font(.system(size:14))
                    Text("Mon")
                    Text("Tue")
                    Text("Wed")
                    Text("Thu")
                    Text("Fri")
                }
                .font(.system(size:16))
                .fontWeight(.bold)
                                //Conditions
                GridRow{
                    WeatherIcon(condition: wm.conditonId, description: wm.conditionDetail)
                    if wm.dailyWeather.count > 0 {
                        WeatherIcon(condition: wm.dailyWeather[1].weather[0].id, description: wm.dailyWeather[1].weather[0].description)
                        WeatherIcon(condition: wm.dailyWeather[2].weather[0].id, description: wm.dailyWeather[2].weather[0].description)
                        WeatherIcon(condition: wm.dailyWeather[3].weather[0].id, description: wm.dailyWeather[3].weather[0].description)
                        WeatherIcon(condition: wm.dailyWeather[4].weather[0].id, description: wm.dailyWeather[4].weather[0].description)
                        WeatherIcon(condition: wm.dailyWeather[5].weather[0].id, description: wm.dailyWeather[5].weather[0].description)
                    }
                        
                }
               .padding(.top, 2)
//                .padding(.leading, 3)
                    //Hi Temps
                GridRow{
                    
                    if wm.dailyWeather.count > 0{
                        Text(wm.formatPrecision(temp: wm.dailyWeather[0].temp.max))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[1].temp.max))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[2].temp.max))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[3].temp.max))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[4].temp.max))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[5].temp.max))
                    }
//                    else{
//                        Text("Error Loading Highs")
//                    }
                }
                .font(.subheadline)
                .fontWeight(.bold)
                //Lo Temps
                GridRow{
                    
                    if wm.dailyWeather.count > 0 {
                        Text(wm.formatPrecision(temp: wm.dailyWeather[0].temp.min))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[1].temp.min))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[2].temp.min))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[3].temp.min))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[4].temp.min))
                        Text(wm.formatPrecision(temp: wm.dailyWeather[5].temp.min))
                    }
                    
                    
                }
                .font(.system(size:11))
                
                
            }
        }
        
        .frame(width: 350, height: 195, alignment: .center)
        .padding(.leading)
        .foregroundColor(themeColour)

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherModel())
            .environmentObject(WPService())
    }
}
