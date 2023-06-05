//
//  DiceType.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//

import Foundation

struct Dice {
    
    var d: Int
    var v: Int
    var name: String{"D\(d)"}
    var imageName:String{"d\(d).\(v)"}

    static var diceTypes: [Dice] {
        // types of supported dice
        let sides = [2,3,4,5,6,8,10,12,20,100]
        var dice: [Dice] = []
        for i in sides {
            for n in 1...i {
                let die = Dice(d: i, v: n)
                dice.append(die)}
        }
        return dice
    }
    
}

