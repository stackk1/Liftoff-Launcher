//
//  WeatherBackgroundView.swift
//  X
//
//  Created by Andrew on 2023-06-16.
//

import SwiftUI

struct WeatherWidgetView: View {
    @EnvironmentObject var wp: WPService
    var updateColors: Int = 0
    var body: some View {        ZStack{
            if wp.iconColor == "None" || wp.labelColor == "None"{
                Rectangle()
                    .reverseMask{
                        WeatherView()
                            .padding()
                    }
                    .foregroundStyle(ColourService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .cornerRadius(20)
                    .accessibilityIdentifier("APPBUTTON_WIDGET_WEATHER")
            }
            else{
                Rectangle()
                    .foregroundStyle(ColourService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .cornerRadius(20)
                    .accessibilityIdentifier("APPBUTTON_WIDGET_WEATHER")
                WeatherView()
            }

        }
    }
}

struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView()
            .environmentObject(WPService())
            .environmentObject(NavigationService())
            .environmentObject(WeatherModel())
            .environmentObject(ColourService())
    }
}
