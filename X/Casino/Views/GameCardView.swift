//
//  GameCardView.swift
//  Casino
//
//  Created by Andrew on 2023-06-04.
//

import SwiftUI


struct GameCardView: View {
    @EnvironmentObject var gm: GameModel
    let textBackgroundRadius:CGFloat = 150
    var gameName: String
    var body: some View {
        ZStack{
            
            Rectangle()
                .cornerRadius(50)
            //use custom color model to set card color
                .foregroundColor(RandomColour.colorView())
                .shadow(radius: 15)
            VStack{
                Image(gameName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: textBackgroundRadius, height: textBackgroundRadius, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top, 50.0)
                
                Text(gameName)
                    .font(.title).foregroundColor(Color.white)
                    .padding(.horizontal, 20.0).padding(.vertical, 10)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.bottom, 50)
            }
            
            
        }
    }
}


//MARK: Preview Code
struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(gameName: "War")
            .environmentObject(GameModel())
    }
}
