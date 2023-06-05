//
//  DiceView.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//

import SwiftUI

struct DiceView: View {
    @EnvironmentObject var gm: GameModel
    @State var d1 = 1
    @State var d2 = 1
    @State var pScore = 0
    @State var cScore = 0
    @State var tie = 0
    
    var body: some View {
        //Background settings check
        let bg = gm.background
        ZStack {
            if (bg == true) {
                Image(gm.backgroundImage)
                    .resizable()
                    .ignoresSafeArea(.all, edges: .top)
                
            }
            VStack {
                Spacer()
                Text("Dice Game")
                    .font(.largeTitle)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
                //MARK: Dice Images
                HStack {
                    //image names are formatted "d(numberOfSides).(faceValue)
                    Image("d6.\(d1)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("d6.\(d2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
                Spacer()
                //Roll Button
                Button("Roll") {
                    roll()
                }
                .padding()
                .padding([.leading, .trailing], 40)
                .background(Color.red)
                .cornerRadius(50)
                .foregroundColor(Color.white)
                .font(.system(size: 18, weight: .bold, design: .default))
                Spacer()
                //MARK: scoreboard
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 5.0)
                        Text(String (pScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 5.0)
                        Text(String(cScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Tie")
                            .font(.headline)
                            .padding(.bottom, 5.0)
                        Text(String(tie))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                Button("Reset") {
                    reset()
                }.padding()
                    .padding([.leading, .trailing], 15)
                    .background(Color.green)
                    .cornerRadius(50)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold, design: .default))
                
                
            }
            .padding()
            .foregroundColor(bg == true ? .white : .black)
        }
    }
    
    // MARK: Functions
    // Roll
    func roll() {
        //Spin Slots
        let d1v = Int.random(in: 1...6)
        d1 = d1v
        let d2v = Int.random(in: 1...6)
        d2 = d2v
        //let slot3V = Int.random(in: 1...3)
        //rSlot = slot3V
        //Check Score
        if d1 > d2 {
            pScore += 1}
        else if d2 > d1 {
            cScore += 1}
        else {tie += 1}
    }
    //NEW GAME
    func reset() {
        d1 = 1
        d2 = 1
        pScore = 0
        cScore = 0
        tie = 0
    }
    
    
}


//MARK: Preview Code
struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
            .environmentObject(GameModel())
    }
}
