
import SwiftUI

struct DiceRoller: View {
    @EnvironmentObject var gm: GameModel
    
    @State var numberOfDice = 5
    @State var numberOfSides = 6
    @State var diceValues = [1,1,1,1,1]
    @State var total = 0
    @State var total2 = 0
    
    var body: some View {
        //Background settings check 
        let bg = gm.background
        ZStack {
            if (bg == true) { Image(gm.backgroundImage)
                    .resizable()
                .ignoresSafeArea(.all, edges: .top)}
            VStack {
                Text("Dice Roller").font(.largeTitle).padding([.leading, .bottom, .trailing])
                Text("Total").font(.headline).padding(.bottom, 5.0)
                Text(String(total)).font(.largeTitle)
                
                HStack{
                    Text("Number of Dice:")
                    Button(
                        action:{
                            numberOfDice -= 1
                        },
                        label: {
                            Image(systemName: "minus.square.fill")
                        })
                    Text(String(numberOfDice))
                    Button(
                        action:{numberOfDice += 1},
                        label: {Image(systemName: "plus.square.fill")
                        })
                }
                Picker("Number of Dice: ", selection: $numberOfDice){
                    ForEach (0..<5) { index in
                        Text(String(index + 1)).tag(index + 1)
                    }
                // TODO: update view when numberOfDice changes. Is a State property already though?
                    
                }.pickerStyle(WheelPickerStyle())

                    LazyHStack{
                        ForEach(0..<diceValues.count-1, id:\.self) {index in
                            Image("d6.\(diceValues[index])")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode:.fit)
                        }
                    }.padding()
                    Spacer()
                    HStack{
                        Button("Roll") {
                            roll()
                        }.padding().padding([.leading, .trailing], 40)
                            .background(Color.red)
                            .cornerRadius(50)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
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
                .onAppear(perform: {
                    roll()
                    reset()
                })
            }
        }
    
        func roll() {
            diceValues = []
            for _ in (0...numberOfDice){
                let value = Int.random(in: 1...numberOfSides)
                diceValues.append(value)
            }
            total += diceValues.reduce(0, +)
            //Math checker
            for die in (0..<diceValues.count-1) {
                print(diceValues[die])
            }
            for value in diceValues {
                total2 += value
            }
            print("total : \(total)")
            print("total 2:  \(total2)")
            
        }
        func reset() {
            total = 0
        }
        
    
}

//MARK: Preview Code
struct DiceRoller_Previews: PreviewProvider {
    static var previews: some View {
        DiceRoller()
            .environmentObject(GameModel())
    }
}
