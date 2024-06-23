//
//  WeatherTileView.swift
//  X
//
//  Created by AndrewStack on 2023-06-29.
//

import SwiftUI

struct SunriseTileView: View {
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
                    Image(systemName: "sunrise.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Sunrise")
                            .fontWeight(.bold)
                        Text(wm.formatDaylightHours(date: wm.sunrise))
                    }
                }
                
                HStack{
                    Image(systemName: "sunset.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Sunset")
                            .fontWeight(.bold)
                        Text(wm.formatDaylightHours(date: wm.sunset))
                    }
                }
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}

struct WeatherTileView_Previews: PreviewProvider {
    static var previews: some View {
        SunriseTileView()
            .environmentObject(WeatherModel())
            .environmentObject(WPService())
    }
}
