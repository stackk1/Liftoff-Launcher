//
//  WeatherView.swift
//  X
//
//  Created by Andrew on 2023-06-08.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var wm: WeatherModel
    @EnvironmentObject var wp: WPService
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                VStack(alignment: .leading){
                    Text("\(wm.location) Weather")
                        .fontWeight(.semibold)
                    Text("Current Temp: \(wm.formattedTemp(temp: wm.currentTemp))°C")
                        .font(.caption)
                    Text("Feels Like: \(wm.formattedTemp(temp:wm.feelTemp, places:0))°C")
                        .font(.caption)
                }
                Spacer()
                Button(action: {
                    updateView()
                    wm.reset()
                }, label: {Image(systemName: "arrow.counterclockwise.icloud.fill").imageScale(.large)})
                    .padding(.trailing)
            }
           .padding(.bottom, 3)

            Grid(alignment: .center, horizontalSpacing: 15, verticalSpacing: 0){
                // Days of the week
                GridRow{
                    Text("Today")
                        .font(.system(size:14))
                    Text("Mon")
                    Text("Tue")
                    Text("Wed")
                    Text("Thu")
                    Text("Fri")
                }
                .font(.system(size:16))
                .fontWeight(.bold)
                                //Conditions
                GridRow{
                    WeatherIcon(condition: wm.conditonId, description: wm.conditionDetail)
                    if wm.dayOne.count > 0 {
                        WeatherIcon(condition: wm.dayOne[0].weather[0].id, description: wm.dayOne[0].weather[0].description)
                        WeatherIcon(condition: wm.dayTwo[0].weather[0].id, description: wm.dayTwo[0].weather[0].description)
                        WeatherIcon(condition: wm.dayThree[0].weather[0].id, description: wm.dayThree[0].weather[0].description)
                        WeatherIcon(condition: wm.dayFour[0].weather[0].id, description: wm.dayFour[0].weather[0].description)
                        WeatherIcon(condition: wm.dayFive[0].weather[0].id, description: wm.dayFive[0].weather[0].description)
                    }
                        
                }
               .padding(.top, 2)
//                .padding(.leading, 3)
                    //Hi Temps
                GridRow{
                    Text(wm.formattedTemp(temp: wm.highTemp))
                    if wm.dayOne.count > 0{
                        Text(wm.formattedTemp(temp: wm.dayOne[0].main.temp_max))
                        Text(wm.formattedTemp(temp: wm.dayTwo[0].main.temp_max))
                        Text(wm.formattedTemp(temp: wm.dayThree[0].main.temp_max))
                        Text(wm.formattedTemp(temp: wm.dayFour[0].main.temp_max))
                        Text(wm.formattedTemp(temp: wm.dayFive[0].main.temp_max))
                    }
//                    else{
//                        Text("Error Loading Highs")
//                    }
                }
                .font(.subheadline)
                .fontWeight(.bold)
                //Lo Temps
                GridRow{
                    Text(wm.formattedTemp(temp: wm.lowTemp))
                    if wm.dayOne.count > 0 {
                        
                        Text(wm.formattedTemp(temp: wm.dayOne[0].main.temp_min))
                        Text(wm.formattedTemp(temp: wm.dayTwo[0].main.temp_min))
                        Text(wm.formattedTemp(temp: wm.dayThree[0].main.temp_min))
                        Text(wm.formattedTemp(temp: wm.dayFour[0].main.temp_min))
                        Text(wm.formattedTemp(temp: wm.dayFive[0].main.temp_min))
                    }
                    else{
                        Text("Tap to Reload Weather")
                            .gridCellColumns(5)
                    }
                    
                }
                .font(.system(size:11))
                
                
            }
        }
        .frame(width: 350, height: 195, alignment: .center)
        .padding()
        .foregroundColor({
            if wp.labelColor.caseInsensitiveCompare("Black") == .orderedSame{
                return Color(.black)
            }
            else if wp.labelColor.caseInsensitiveCompare("None") == .orderedSame{
                return Color(.clear)
            }
            else{
                return Color(.white)
            }
        }()
        )
        .onAppear(perform: {
            updateView()
        })
    }
    func updateView(){
        let splitDays = wm.splitArrayIntoDays(wm.forcast)
        wm.dayOne = splitDays.dayOne
        wm.dayTwo = splitDays.dayTwo
        wm.dayThree = splitDays.dayThree
        wm.dayFour = splitDays.dayFour
        wm.dayFive = splitDays.dayFive
    }

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherModel())
            .environmentObject(WPService())
    }
}
