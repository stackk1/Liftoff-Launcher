//
//  WeatherBackgroundView.swift
//  X
//
//  Created by Andrew on 2023-06-16.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var wp: WPService
    //var maskContent: String
    
    var body: some View {
        
        ZStack{
            if wp.iconColor.caseInsensitiveCompare("None") == .orderedSame{
                Rectangle()
                    .reverseMask{WeatherTextView()}
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
                    .cornerRadius(20)
                   
                
            }
            else{
                Rectangle()
                    .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
                    .cornerRadius(20)
                WeatherTextView()
            }
            
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
