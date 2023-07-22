//
//  UviTileView.swift
//  X
//
//  Created by AndrewStack on 2023-07-21.
//

import SwiftUI

struct UviTileView: View {
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
                    Image(systemName: "sun.max")
                        .padding(.trailing)
                    VStack{
                        Text("UV")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].uvi))
                    }
                }
                
                HStack{
                    Image(systemName: "humidity.fill")
                        .padding(.trailing)
                    VStack{
                        Text("Humidity")
                            .fontWeight(.bold)
                        Text(String(wm.hourlyWeather[1].humidity))
                    }
                }
            }
            .foregroundColor(wp.setIconColor())
            .imageScale(.large)
        }
    }
}

struct UviTileView_Previews: PreviewProvider {
    static var previews: some View {
        UviTileView()
    }
}
