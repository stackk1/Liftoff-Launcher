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
                    Text("°\(wm.tempUnit)")
                        .padding(.top, 5)
                }
                WeatherIcon(condition: wm.conditonId, description: wm.conditionDetail, frameWidth: 180, frameHeight: 100, fontSize: 28)
                
               // Text(wm.conditionDetail)
                Spacer()
                VStack(spacing: 8){
                    HStack(spacing: 8){
                        SunriseTileView()
                        PrecipitationTileView()
                    }
                    HStack(spacing: 8){
                        UviTileView()
                        WindTileView()
                    }
                }
                .padding()
                Spacer()
            }
        }
        .accessibilityIdentifier("SCREEN_WEATHER")
        .accessibilityElement(children: .contain)
        .foregroundColor(wp.setLabelColor())
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
