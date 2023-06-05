//
//  SlotView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct SlotView: View {
    @EnvironmentObject var gm: GameModel
    
    @State var score = 1000
    @State var leftSlot = 3
    @State var centerSlot = 3
    @State var rightSlot = 3
    @State var GameOver = false
    

    
    var body: some View {

        //Background settings check
        let bg = gm.background
        
        ZStack {
            if (bg == true) {
                Image(gm.backgroundImage)
                    .resizable()
                .ignoresSafeArea(.all, edges: .top)}
            
            VStack {
                
                Text("SwiftUISlots")
                    .font(.largeTitle)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
                //MARK: SCORE / Reset Button
                
                HStack{
                    Button(
                        action: {
                            reset()
                            
                        },
                        label: {
                            Image(systemName: "gobackward")
                            
                        })
                    Text("Score :")
                    Text(String(score))
                }
                
                Spacer()
                //MARK: Rollers
                HStack {
                    if leftSlot == 1 {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }else if leftSlot == 2{
                        Image("cherry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }else {
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    if centerSlot == 1 {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if centerSlot == 2{
                        Image("cherry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    if rightSlot == 1 {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }else if rightSlot == 2{
                        Image("cherry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }else {Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding()
                Spacer()
                //MARK: Gameover message/spin button
                if GameOver == true {
                    Text("Game Over").font(.largeTitle)
                    Button {reset()
                    }
                label: {
                    Text("New Game")
                }
                }else{
                    Button("Spin") {
                        spin()
                    }
                    .padding()
                    .padding([.leading, .trailing], 40)
                    .background(Color.red)
                    .cornerRadius(50)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .bold, design: .default))
                }
                Spacer()
            }
            .padding()
            .foregroundColor(bg == true ? .white : .black)
        }
    }
    
    //MARK: Functions
    // SPIN
    func spin() {
        //Spin Slots
        let slot1V = Int.random(in: 1...3)
        leftSlot = slot1V
        let slot2V = Int.random(in: 1...3)
        centerSlot = slot2V
        let slot3V = Int.random(in: 1...3)
        rightSlot = slot3V
        //Check Score
        if (leftSlot == centerSlot) && (centerSlot == rightSlot) {
            score += 100
        } else {score -= 25}
        //Check Game over
        if score <= 0 {GameOver = true}
    }
    // NEW GAME
    func reset() {
        GameOver = false
        leftSlot = 3
        centerSlot = 3
        rightSlot = 3
        score = 1000
    }

    
    
}


//MARK: Preview Code
struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView()
            .environmentObject(GameModel())
    }
}
