//
//  SettingsView.swift
//  Casino
//
//  Created by Andrew on 2023-05-10.
//

import SwiftUI

struct GameSettingsView: View {
    @EnvironmentObject var gm: GameModel
    
    var body: some View {
        
        VStack{
            Text("Settings")
                .font(.largeTitle)
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
            
            //MARK: examples of background selectors
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
                Picker("Wallpaper Image", selection: $gm.backgroundImage){
                    Text("Plain").tag("Plain")
                    Text("Wood").tag("Wood")
                    Text("Cartoon Wood").tag("Cartoon Wood")
                    Text("Cloth").tag("Cloth")
                    Text("Space").tag("Space")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
           
            HStack{
                Picker("Wallpaper Image", selection: $gm.backgroundImage){
                    Text("Plain").tag("Plain")
                    Text("Wood").tag("Wood")
                    Text("Cartoon Wood").tag("Cartoon Wood")
                    Text("Cloth").tag("Cloth")
                    Text("Space").tag("Space")
                }
                .pickerStyle(WheelPickerStyle())
            }
            Spacer()
        }
        .padding()
    }
}


//MARK: Preview Code
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView()
            .environmentObject(GameModel())
    }
}
