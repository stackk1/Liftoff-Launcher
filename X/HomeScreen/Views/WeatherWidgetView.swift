//
//  WeatherBackgroundView.swift
//  X
//
//  Created by Andrew on 2023-06-16.
//

import SwiftUI

struct WeatherWidgetView: View {
    @EnvironmentObject var wp: WPService
    //var maskContent: String
    
    var body: some View {
        
        ZStack{
            if wp.iconColor.caseInsensitiveCompare("None") == .orderedSame{
                Rectangle()
                    .reverseMask{
                        WeatherView()
                            
                    }
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
                    .cornerRadius(20)
                    .padding(.leading)
                   
                
            }
            else{
                Rectangle()
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
                    .cornerRadius(20)
                WeatherView()
                    .padding(.leading)
                    
            }
            
        }
    }
}

struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView()
            .environmentObject(WPService())
    }
}
