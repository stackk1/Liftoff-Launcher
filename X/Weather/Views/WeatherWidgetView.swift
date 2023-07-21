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
    //var maskContent: String
    
    var body: some View {
        
        ZStack{
            if wp.iconColor.caseInsensitiveCompare("None") == .orderedSame{
                Rectangle()
                    .reverseMask{
                        WeatherView()
                            .padding()
                    }
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .cornerRadius(20)
                    
                   
                
            }
           else if wp.labelColor.caseInsensitiveCompare("None") == .orderedSame{
                Rectangle()
                    .reverseMask{
                        WeatherView()
                            .padding()
                    }
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .cornerRadius(20)
                    
                   
                
            }
            else{
                Rectangle()
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                    .cornerRadius(20)
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
