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
                        Text("Wallpaper: \(wp.wallpaper ? "On" : "Off")")
                    })
                HStack{
                    Text("Wallpaper Image")
                    Spacer()
                    Picker("Wallpaper Image", selection: $wp.wallpaperImage){
                        Text("Plain").tag("Plain")
                        Text("Wood").tag("Wood")
                        Text("Cartoon Wood").tag("Cartoon Wood")
                        Text("Cloth").tag("Cloth")
                        Text("Space").tag("wallpaper")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
            }
            //MARK: - Game Settings
            VStack{
                
                Text("Game Settings")
                    .font(.title)
                Divider()
                    .frame(width: 1.0, height: 1.0)
                HStack{
                    if gm.background {
                        Text("Wallpaper: On")
                    } else {
                        Text("Wallpaper: Off")
                    }
                    Spacer()
                    Text("Image: \(gm.backgroundImage)")
                }
                .multilineTextAlignment(.leading)
                
                Toggle(
                    isOn: $gm.background,
                    label: {
                        Text("Background Image")
                    })
                HStack{
                    Text("Background Image")
                    Spacer()
                    Picker("Wallpaper Image", selection: $gm.backgroundImage){
                        Text("Plain").tag("Plain")
                        Text("Wood").tag("Wood")
                        Text("Cartoon Wood").tag("Cartoon Wood")
                        Text("Cloth").tag("Cloth")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
            }
            //MARK: - Book Settings
            VStack{
                Text("Book Settings")
                    .font(.title)
                Divider()
                    .frame(width: 1.0, height: 1.0)
                HStack{
                    Text("Current View:")
                        .fontWeight(.bold)
                    if model.pageView {
                        Text("Page View")
                    }else {
                        Text ("Scroll View")
                    }
                    Spacer()
                }
                // Change Page View
                Toggle(
                    isOn: $model.pageView,
                    label: {Text("Page View")
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
        
    }
}

