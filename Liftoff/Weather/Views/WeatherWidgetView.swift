//
//  WeatherBackgroundView.swift
//  X
//
//  Created by Andrew on 2023-06-16.
//

import SwiftUI

struct WeatherWidgetView: View {
    @EnvironmentObject var wp: ThemeService
    var updateColors: Int = 0
    var body: some View {
        if wp.iconColor == "Animated" {
            ZStack {
                AnimatedGradientView()
                Rectangle()
                    .foregroundStyle(ColorService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .mask(
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                            WeatherView()
                                .frame(width: 100, height: 100)
                                .blendMode(.destinationOut)
                        }
                    )
                    .compositingGroup()
                    .accessibilityIdentifier("APPBUTTON_WIDGET_WEATHER")
            }
        }
            else if wp.iconColor == "None" {
                ZStack{
                    Rectangle()
                        .foregroundStyle(ColorService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                        .mask(
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                WeatherView()
                                    .frame(width: 100, height: 100)
                                    .blendMode(.destinationOut)
                            }
                        )
                        .compositingGroup()
                        .accessibilityIdentifier("APPBUTTON_WIDGET_WEATHER")
                }
            }
        
        else{
            ZStack{
                Rectangle()
                    .foregroundStyle(ColorService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
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
            .environmentObject(ThemeService())
            .environmentObject(NavigationService())
            .environmentObject(WeatherModel())
            .environmentObject(ColorService())
    }
}
