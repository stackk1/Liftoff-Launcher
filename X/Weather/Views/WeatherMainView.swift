//
//  WeatherMainView.swift
//  X
//
//  Created by Andrew on 2023-06-26.
//

import SwiftUI

struct WeatherMainView: View {
    @EnvironmentObject var wp: WPService
    @EnvironmentObject var nav: NavigationService
    @EnvironmentObject var wm: WeatherModel
    @ObservedObject var cs = ColourService()
    
    var body: some View {
        let rows = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        ZStack {
            if wp.wallpaperImage.caseInsensitiveCompare("Black") != .orderedSame {
                Image(wp.wallpaperImage)
                    .resizable()
                    .ignoresSafeArea()
            }
            else{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.black)
            }
            
            VStack(spacing:0){
                Spacer()
                Text(wm.city)
                    .font(.system(size: 35))
                HStack(alignment: .top)
                {
                    Text(wm.formatPrecision(temp: wm.feelTemp)).font(.system(size: 50))
                    Text("°C")
                        .padding(.top, 5)
                }
                Text(wm.conditionDetail)
                Spacer()
                VStack(spacing: 15){
                    HStack(spacing: 15){
                        WeatherTileView(title:"Sunrise")
                        WeatherTileView(title:"Sunset")
                    }
                    HStack(spacing: 15){
                        WeatherTileView(title:"Precipitation")
                        WeatherTileView(title:"Temperature")
                    }
                }
                Spacer()
                
            }
        }
        .foregroundColor(
            wp.setLabelColor()
        )
    }
}

struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView()
            .environmentObject(WPService())
            .environmentObject(NavigationService())
            .environmentObject(WeatherModel())
            .environmentObject(ColourService())
    }
}
