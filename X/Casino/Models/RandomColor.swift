//
//  RandomColor.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI
import Foundation


struct RandomColour {
    static func generate() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.8)}
    
    static func colorView() -> Color {
        return Color(RandomColour.generate())
        
    }
}
