//
//  PrecipitationTileView.swift
//  X
//
//  Created by AndrewStack on 2023-07-21.
//

import SwiftUI

struct PrecipitationTileView: View {
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
                    Image(systemName: "cloud.heavyrain.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Precipitation")
                            .fontWeight(.bold)
                        Text(wm.hourlyWeather[1].weather[0].main)
                        
                    }
                }
                HStack{
                    Image(systemName: "sunset.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Clouds")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].clouds))
                    }
                }
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}
struct PrecipitationTileView_Previews: PreviewProvider {
    static var previews: some View {
        PrecipitationTileView()
    }
}
