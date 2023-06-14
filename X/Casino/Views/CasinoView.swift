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
                        // List of games
                        ForEach (0..<gm.gameNames.count, id: \.self) { n in
                            
                            NavigationLink(destination: gm.gameList[n].environmentObject(DiceUIService()),
                                           label: {
                                GameCardView(gameName: gm.gameNames[n])
                                    
                            })
                            .padding()
                            
                        }
                    }
                }
                
            }
        .navigationBarHidden(true)
    }
    
}

//MARK: Preview Code
struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
            .environmentObject(GameModel())
    }
}
