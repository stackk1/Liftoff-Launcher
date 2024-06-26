
import SwiftUI

struct DiceRoller: View {
    @EnvironmentObject var gm: GameModel
    @EnvironmentObject var ds: DiceUIService
    
     var numberOfDice = 5
     var numberOfSides = 6
//    @State var diceValues = [1,1,1,1,1]
//    @State var total = 0
//    @State var total2 = 0
    var rows = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
       
        //Background settings check 
        let bg = gm.background
        ZStack {
            if (bg == true) {
                Image(gm.backgroundImage)
                    .resizable()
                    .ignoresSafeArea()
            }
            VStack {
                Text("Dice Roller")
                    .font(.largeTitle).padding([.leading, .bottom, .trailing])
                    .accessibilityIdentifier("SCREEN_GAMES_DICE_ROLLER")
                Text("Total")
                    .font(.headline).padding(.bottom, 5.0)
                Text(String(ds.diceValueTotal))
                    .font(.largeTitle)
                    .accessibilityIdentifier("DICE_TOTAL_VALUE")
                HStack{
                    Text("Number of Dice:")
                    Button(
                        action:{
                            ds.numberOfDice -= 1
                        },
                        label: {
                            Image(systemName: "minus.square.fill")
                        })
                    Text(String(ds.numberOfDice))
                    Button(
                        action:{ds.numberOfDice += 1},
                        label: {Image(systemName: "plus.square.fill")
                        })
                }
                LazyVGrid(columns: rows){
                    ForEach(0..<ds.diceValues.count-1, id:\.self) {index in
                        Image("d6.\(ds.diceValues[index])")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode:.fit)
                    }
                }
                Spacer()
                HStack{
                    Button("Roll") {
                        ds.roll()
                    }
                    .padding().padding([.leading, .trailing], 40)
                    .background(Color.red)
                    .cornerRadius(50)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .accessibilityIdentifier("BUTTON_ROLL")
                    Button(
                        action: {
                            reset()
                        },
                        label: {
                            Image(systemName: "gobackward")
                        })
                }
            }
            .foregroundColor(bg == true ? .white : .black)
            .padding()
        }
        }
        func reset() {
            ds.diceValueTotal = 0
        }
}

//MARK: Preview Code
struct DiceRoller_Previews: PreviewProvider {
    static var previews: some View {
        DiceRoller()
            .environmentObject(GameModel())
            .environmentObject(DiceUIService())
    }
}
