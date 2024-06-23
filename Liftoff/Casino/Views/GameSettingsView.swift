//
//  SettingsView.swift
//  Casino
//
//  Created by Andrew on 2023-05-10.
//

import SwiftUI

struct GameSettingsView: View {
    @EnvironmentObject var gm: GameModel
    @EnvironmentObject var ds: DiceUIService
    
    var body: some View {
        
       
            VStack(alignment: .leading, spacing: 0){
                
                Text("Game Settings")
                    .font(.title)
                Divider()
                    .padding(.bottom)
                
                Toggle(
                    isOn: $gm.background,
                    label: {
                        Text("Background")
                    })
                    Picker("Wallpaper Image", selection: $gm.backgroundImage){
                        Text("Wood").tag("Wood")
                        Text("Cartoon Wood").tag("Cartoon Wood")
                        Text("Plain").tag("Plain")
                        Text("Cloth").tag("Cloth")
                        Text("Space").tag("Space")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(.top, 0)
                VStack(alignment: .leading, spacing: 5){
                    Text("Default Number of Dice:")
                    HStack{
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
                }
                Text("Default Die:")
                    .padding(.vertical)
                Picker("Default Die", selection: $ds.numberOfSides){
                    ForEach (0..<ds.diceList.count, id:\.self) {sides in
                        Text(String(ds.diceList[sides])).tag(ds.diceList[sides])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
            }
            .padding(.horizontal)
            .accessibilityIdentifier("SCREEN_GAMES_SETTINGS")
            .accessibilityElement(children: .contain)
        }
    }
    
    
    //MARK: Preview Code
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            GameSettingsView()
                .environmentObject(GameModel())
                .environmentObject(DiceUIService())
        }
    }
