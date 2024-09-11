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
        if wp.iconColor == "None" {
            ZStack {
                // The animated gradient background
                AnimatedGradientView(palette: wp.theme)
                Rectangle()
                    .foregroundStyle(ColorService.randomGradient(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .mask(
                        ZStack {
                            // Full screen Rectangle mask with a cut-out Circle
                            Rectangle() // Covers the entire area
                                .cornerRadius(20)
                            
                            // Cut-out Circle to reveal the gradient below
                            WeatherView()
                                .frame(width: 100, height: 100)
                                .blendMode(.destinationOut) // Makes the circle act as a cutout
                        }
                    )
                    .compositingGroup() // Necessary to apply the blend mode correctly
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
