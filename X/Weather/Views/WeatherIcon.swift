//
//  SwiftUIView.swift
//  WeatherAPITest
//
//  Created by Andrew on 2023-06-18.
//

import SwiftUI

struct WeatherIcon: View {
    @EnvironmentObject var wm: WeatherModel
    var condition: Int = 800
    var description: String = "error"
    var frameWidth: CGFloat = 43
    var frameHeight: CGFloat = 28
    var fontSize: CGFloat = 10
    
    var body: some View {
        
        VStack (spacing: 0){
            ZStack{
//                Circle()
//                    .foregroundColor(.gray)
                switch condition {
                case 0..<300:
                    Image(systemName: "cloud.bolt.rain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 300..<400:
                    Image(systemName: "cloud.drizzle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 500..<600:
                    Image(systemName: "cloud.rain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 600..<700:
                    Image(systemName: "snowflake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 700..<800:
                    Image(systemName: "smoke")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 800:
                    Image(systemName: "sun.max")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                case 800..<900:
                    Image(systemName: "cloud")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameWidth*0.5, height: frameHeight*0.75, alignment: .center)
                        .padding(.bottom, 1)
                default:
                    Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
                        .padding(.bottom, 1)
                }
            }
            Text(description)
                .font(.system(size: fontSize))
                .frame(width: frameWidth, height: frameHeight, alignment: .center)
        }
        .padding(.top, 2)
        
    }
}

struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIcon(condition: 801, description: "testing")
            .environmentObject(WeatherModel())
    }
}
