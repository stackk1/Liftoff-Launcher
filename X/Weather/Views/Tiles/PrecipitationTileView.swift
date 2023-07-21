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
                .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)))
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
