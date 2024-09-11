//
//  SettingsMasterView.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//
import SwiftUI

struct SettingsMasterView: View {
    @EnvironmentObject var gm: GameModel
    @EnvironmentObject var model: BookModel
    @EnvironmentObject var wp: WPService
    @EnvironmentObject var nav: NavigationService
    @EnvironmentObject var ds: DiceUIService
    @EnvironmentObject var wm: WeatherModel
    
    var body: some View {
        
        
        
        VStack{
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            ScrollView{
                //MARK: - Home Settings
                VStack(alignment:.leading){
                    Text("Homescreen Settings")
                        .font(.title)
                    HStack{
                        Text("City:")
                        Spacer()
                        Picker("City", selection: $wm.city){
                            Text("Kelowna").tag("Kelowna")
                            Text("Kamloops").tag("Kamloops")
                            Text("Vancouver").tag("Vancouver")
                            Text("Calgary").tag("Calgary")
                            Text("Edmonton").tag("Edmonton")
                            Text("Victoria").tag("Victoria")
                            Text("Nakusp").tag("Nakusp")
                            Text("Miami").tag("Miami")
                            Text("London").tag("London")
                        }
                        .pickerStyle(MenuPickerStyle())
                        
                    }
                    
                    HStack{
                        Text("Units: ")
                        Spacer()
                        Picker("Weather Units", selection: $wm.weatherUnits){
                            Text("Imperial").tag("imperial")
                            Text("Metric").tag("metric")
                            Text("Kelvin").tag("kelvin")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    HStack{
                        Text("Wallpaper Image:")
                        Spacer()
                        Picker("Wallpaper Image", selection: $wp.wallpaperImage){
                            Text("Black").tag("Black")
                            Text("Plain").tag("Plain")
                            Text("Wood").tag("Wood")
                            Text("Cartoon Wood").tag("Cartoon Wood")
                            Text("Cloth").tag("Cloth")
                            Text("Space").tag("Space")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    HStack{
                        Text("Theme:")
                        Spacer()
                        Picker("Theme", selection: $wp.theme){
                            Text("Chromatic").tag("Chromatic")
                            Text("Pastel").tag("Pastel")
                            Text("Blue Hues").tag("Blue Hues")
                            Text("Earth Tones").tag("Earth Tones")
                            Text("Red Hues").tag("Red Hues")
                            Text("Purple Hues").tag("Purple Hues")
                            Text("Green Hues").tag("Green Hues")
                            Text("Grey Scale").tag("Grey Scale")
                            Text("OLED").tag("OLED")
                            Text("Gold").tag("Gold")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    HStack{
                        Text("Icons: ")
                        Spacer()
                        Picker("Icon Color", selection: $wp.iconColor){
                            Text("White").tag("White")
                            Text("Black").tag("Black")
                            Text("Theme").tag("Theme")
                            Text("Clear").tag("None")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    HStack{
                        Text("Labels: ")
                        Spacer()
                        Picker("Label Color", selection: $wp.labelColor){
                            Text("White").tag("White")
                            Text("Black").tag("Black")
                            Text("None").tag("None")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    HStack{
                        Text("Transparancy:")
                        Spacer()
                        Picker("Transparancy:", selection: $wp.transparancy){
                            Text("None").tag(CGFloat(1.0))
                            Text("Light").tag(CGFloat(0.8))
                            Text("Mid").tag(CGFloat(0.5))
                            Text("Full").tag(CGFloat(0.0))
                        }
                        .pickerStyle(SegmentedPickerStyle())
                }
            }
            .padding(.horizontal)
            //MARK: - Game Settings
            VStack(alignment: .leading){
                
                Text("Game Settings")
                    .font(.title)
                Divider()
                    .frame(width: 1.0, height: 1.0)
                
                Toggle(
                    isOn: $gm.background,
                    label: {
                        Text("Background")
                    })
                HStack{
                    Text("Background Image")
                    Spacer()
                    Picker("Wallpaper Image", selection: $gm.backgroundImage){
                        Text("Plain").tag("Plain")
                        Text("Wood").tag("Wood")
                        Text("Cartoon Wood").tag("Cartoon Wood")
                        Text("Cloth").tag("Cloth")
                        Text("Space").tag("Space")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                HStack{
                    Text("Default Number of Dice :")
                    Spacer()
                    Button(
                        action:{
                            ds.numberOfDice -= 1
                            
                        },
                        label: {Image(systemName: "minus.square.fill")})
                    Text(String(ds.numberOfDice))
                    Button(
                        action:{
                            ds.numberOfDice += 1
                            
                        },
                        label: {Image(systemName: "plus.square.fill")
                        })
                }
                
                
                Text("Default Die:")
                    .padding(.top)
                Picker("Default Die", selection: $ds.numberOfSides){
                    ForEach (0..<ds.diceList.count, id:\.self) {sides in
                        Text(String(ds.diceList[sides])).tag(ds.diceList[sides])
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                
                
            }
            .padding(.horizontal)
            //MARK: - Book Settings
            VStack(alignment:.leading){
                Text("Book Settings")
                    .font(.title)
                // Change Page View
                Toggle(
                    isOn: $model.pageView,
                    label: {Text("\(model.pageView ? "Page" : "Scroll") View")
                    })
            }
            .padding(.horizontal)
            Spacer()
        }
        
    }
}
}



//MARK: Preview Code
struct SettingsMasterView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMasterView()
            .environmentObject(GameModel())
            .environmentObject(WPService())
            .environmentObject(BookModel())
            .environmentObject(DiceUIService())
        
    }
}

