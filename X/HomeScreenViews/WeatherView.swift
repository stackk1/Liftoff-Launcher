//
//  WeatherView.swift
//  X
//
//  Created by Andrew on 2023-06-08.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        GeometryReader{ geo in
            Rectangle()
                .foregroundColor(RandomColour.colorView())
            VStack{
                HStack {
                    VStack(alignment: .leading){
                        Text("Weather")
                        Text("Kelowna B.C.")
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom, 10)
                Grid{
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
                    .frame(width:10,height: 10)
                    .padding(.vertical, 5)
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
                .foregroundColor(.white)
                  
            }
            .padding()
            
            //.postion(geo.frame(in: .local).midX)
            
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
