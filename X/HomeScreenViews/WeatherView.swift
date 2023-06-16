//
//  WeatherView.swift
//  X
//
//  Created by Andrew on 2023-06-08.
//

import SwiftUI

struct WeatherTextView: View {
    @EnvironmentObject var wp: WPService
    
    var body: some View {

//        ZStack{
//            WeatherBackgroundView(maskContent: <#T##String#>)
//            Rectangle()
//                .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
            VStack{
                HStack {
                    VStack(alignment: .leading){
                        Text("Weather")
                            .font(.system(size:20))
                        Text("City")
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom, 5)
                Grid(horizontalSpacing: 15){
                    // Days of the week
                    GridRow{
                        Text("Mon")
                        Text("Tue")
                        Text("Wed")
                        Text("Thu")
                        Text("Fri")
                        Text("Sat")
                        Text("Sun")
                    }
                    .font(.system(size:16))
                    .fontWeight(.bold)
                    //Conditions
                    GridRow{
                        Image(systemName: "sun.max")
                        Image(systemName: "cloud.drizzle")
                        Image(systemName: "cloud.sun")
                        Image(systemName: "cloud.bolt.rain")
                        Image(systemName: "cloud")
                        Image(systemName: "cloud.moon")
                        Image(systemName: "snowflake")
                    }
                    .imageScale(.large)
                    .padding(.vertical, 2)
                    .padding(.leading, 3)
                   //Hi Temps
                    GridRow{
                        Text("38°")
                        Text("29°")
                        Text("33°")
                        Text("30°")
                        Text("29°")
                        Text("31°")
                        Text("0°")
                        
                    }
                    .fontWeight(.bold)
                    //Lo Temps
                    GridRow{
                         Text("16°")
                         Text("15°")
                         Text("17°")
                         Text("13")
                         Text("12")
                         Text("20")
                         Text("-10")
                         
                     }
                }
                .foregroundColor({
                    if wp.labelColor.caseInsensitiveCompare("Black") == .orderedSame{
                        return Color(.black)
                    }
                    else{
                        return Color(.white)
                    }
                }())
                  
            }
            .padding(20)

            
        //}
    }
}

struct WeatherTextView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTextView()
    }
}
