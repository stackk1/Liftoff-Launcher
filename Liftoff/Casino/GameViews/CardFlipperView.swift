//
//  CardFlipperView.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI


struct CardFlipperView: View {
    @EnvironmentObject var gm: GameModel
    
    var body: some View {
        //Background settings check
        let bg = gm.background
        GeometryReader{geo in
            if (bg == true) {
                Image(gm.backgroundImage)
                    .resizable()
                .ignoresSafeArea()}
            TabView{
                
                ForEach (1..<51) { i in
                    let cardNum = Int.random(in: 1...50)
                    
                    //Cards
                    ZStack{
                        Text(String(cardNum))
                            .accessibilityIdentifier("CARD_VALUE")
                        Rectangle()
                        //Use Custom RandomColor model to set card and shaddow colors
                            .foregroundColor(ColourService.randomColor())
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: ColourService.randomColor(), radius: 25)
                        
                        
                        Image(systemName: "\(cardNum).circle").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width-80, height: geo.size.height-100, alignment: .center)
                            .foregroundColor(bg == true ? .white : .black)
                            
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.never))
            .accessibilityIdentifier("SCREEN_GAMES_CARD_FLIPPER")
        }
    }
}


//MARK: Preview Code
struct CardFlipperView_Previews: PreviewProvider {
    static var previews: some View {
        CardFlipperView()
            .environmentObject(GameModel())
    }
}
