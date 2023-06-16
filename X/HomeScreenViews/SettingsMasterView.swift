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
                    //                    Toggle(
                    //                        isOn: $wp.wallpaper,
                    //                        label: {
                    //                            Text("Wallpaper")
                    //                        })
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
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    HStack{
                        Text("Icons: ")
                        Spacer()
                        Picker("Label Color", selection: $wp.iconColor){
                            Text("White").tag("White")
                            Text("Black").tag("Black")
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
                    //                        Button(
                    //                            action:{
                    //                                wp.transparancy -= 0.10000
                    //
                    //                            },
                    //                            label: {Image(systemName: "minus.square.fill")})
                    //                        Text(String(transparancy))
                    //                        Button(
                    //                            action:{
                    //                                wp.transparancy += 0.10000
                    //
                    //                            },
                    //                            label: {Image(systemName: "plus.square.fill")
                    //                            })
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
                    //
                    //                    Picker("Default Number of Dice", selection: $ds.numberOfDice){
                    //                        ForEach (0..<6) {selection in
                    //                            Text(String(selection)).tag(selection)
                    //                        }
                    //                    }
                    //                    .frame(width: 50, height: 90)
                    //                    .pickerStyle(WheelPickerStyle())
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

