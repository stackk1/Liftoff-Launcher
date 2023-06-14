//
//  DiceUIService.swift
//  X
//
//  Created by Andrew on 2023-06-13.
//

import Foundation

class DiceUIService: ObservableObject {
    @Published var numberOfDice = 5
    @Published var numberOfSides = 6
    @Published var diceValues: [Int]
    @Published var diceValueTotal = 0
    
    init (numberOfDice: Int = 6, numberOfSides: Int = 6) {
        var dice: [Int] = []
        for _ in 0...numberOfDice {
            dice.append(Int.random(in: 1..<numberOfSides + 1))
        }
        diceValues = dice
    }
    
    
    
    func roll() {
        diceValues = []
        for _ in (0...numberOfDice){
            let value = Int.random(in: 1...numberOfSides)
            diceValues.append(value)
        }
        diceValueTotal += diceValues.reduce(0, +)
        //Math checker
        for die in (0..<diceValues.count-1) {
            print(diceValues[die])
        }
//        var totalCheck = 0
//        for value in diceValues {
//            totalCheck += diceValues[value]
//
//        }
        print("total : \(diceValueTotal)")
//        print("total check:  \(totalCheck)")
        
    }
}
