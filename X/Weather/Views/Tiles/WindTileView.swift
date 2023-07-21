//
//  TileView.swift
//  X
//
//  Created by AndrewStack on 2023-07-21.
//

import SwiftUI

struct WindTileView: View {
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
                    Image(systemName: "wind")
                        .padding(.trailing)
                    VStack{
                        Text("Wind Speed")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].wind_speed))
                        
                    }
                }
                HStack{
                    Image(systemName: "wind.snow")
                        .padding(.trailing)
                    VStack{
                        Text("Gusts")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].wind_gust))
                    }
                }
                
                
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        WindTileView()
    }
}
