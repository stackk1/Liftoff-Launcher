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
                .foregroundStyle(ColourService.randomGradient(Palette: wp.theme, opac: {
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
