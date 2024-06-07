//
//  ContentView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct CasinoView: View {
    @EnvironmentObject var gm: GameModel
    
    var body: some View {
        let bg = gm.background
        
      
        ZStack{
                if bg {
                    Image(gm.backgroundImage)
                        .resizable()
                        .ignoresSafeArea()
                }
                ScrollView {
                    
                    LazyVStack{
                        HStack{
                            Text("Games")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            //Settings Button
                            NavigationLink(
                                destination: GameSettingsView(),
                                label: {
                                    Image(systemName: "gear")
                                }
                            ).accessibilityIdentifier("SETTINGSBUTTON_GAMES")
                            
                        }
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        // List of games
                        ForEach (0..<gm.gameNames.count, id: \.self) { n in
                            
                            NavigationLink(destination: gm.gameList[n],
                                           label: {
                                GameCardView(gameName: gm.gameNames[n])
                            })
                            .padding()
                            
                        }
                    }
                }
                
            }
        .navigationBarHidden(true)
        .accessibilityIdentifier("SCREEN_GAMES")
    }
    
}

//MARK: Preview Code
struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
            .environmentObject(GameModel())
    }
}
