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
        
        VStack(alignment: .leading){
//            Text("Settings")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//            Divider()

            //MARK: - Home Settings
            VStack{
                Text("Homescreen Settings")
                    .font(.title)
                Toggle(
                    isOn: $wp.wallpaper,
                    label: {
                        Text("Wallpaper")
                    })
                HStack{
                    Text("Wallpaper Image:")
                    Spacer()
                    Picker("Wallpaper Image", selection: $wp.wallpaperImage){
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
                    Text("Transparancy:")
                    Spacer()
                  
                        Button(
                            action:{wp.transparancy -= 0.1},
                            label: {Image(systemName: "minus.square.fill")})
                        Text(String(wp.transparancy))
                        Button(
                            action:{wp.transparancy += 0.1},
                            label: {Image(systemName: "plus.square.fill")
                            })
                    }

            }
            //MARK: - Game Settings
            VStack{
                
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
                    Picker("Default Number of Dice", selection: $ds.numberOfDice){
                        ForEach (0..<6) {selection in
                            Text(String(selection)).tag(selection)
                        }
                    }
                    .frame(width: 50, height: 90)
                    .pickerStyle(WheelPickerStyle())
                }
                    
                    HStack{
                        Text("Default Die:")
                        Spacer()
                        Picker("Default Die", selection: $ds.numberOfSides){
                            ForEach (0..<Dice.diceTypes.count, id:\.self) {sides in
                                Text(String(sides)).tag(sides)
                            }
                        }
                        .frame(width: 50, height: 90)
                        .pickerStyle(WheelPickerStyle())
                    }
                
            }
            //MARK: - Book Settings
            VStack{
                Text("Book Settings")
                    .font(.title)
                // Change Page View
                Toggle(
                    isOn: $model.pageView,
                    label: {Text("\(model.pageView ? "Page" : "Scroll") View")
                    })
            }
            Spacer()
        }
        
        .padding(.horizontal)
        
   
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

