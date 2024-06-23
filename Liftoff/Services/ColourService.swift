//
//  RandomColor.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI
import Foundation


class ColourService: ObservableObject {
    
    //@Published var randomTheme = randomRGB()
    //  @Published var disco = 1
    
    
    static func randomColor(Palette: String = "Chromatic", opac: CGFloat = 1.0, cycle: Int = 1) -> Color {
        
        let pallette = Palette
        switch pallette {
        case "Chromatic":
            let red = CGFloat.random(in: 0.0...1.0)
            let green = CGFloat.random(in: 0.0...1.0)
            let blue = CGFloat.random(in: 0.0...1.0)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Pastel":
            let red = CGFloat.random(in: 0.6...1.0)
            let green = CGFloat.random(in: 0.6...1.0)
            let blue = CGFloat.random(in: 0.6...1.0)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Vibrant":
            let red = CGFloat.random(in: 0.8...1.0)
            let green = CGFloat.random(in: 0.2...1.0)
            let blue = CGFloat.random(in: 0.2...1.0)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Blue Hues":
            let red = CGFloat.random(in: 0.0...0.3)
            let green = CGFloat.random(in: 0.0...0.3)
            let blue = CGFloat.random(in: 0.7...1.0)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Earth Tones":
            let red = CGFloat.random(in: 0.4...0.7)
            let green = CGFloat.random(in: 0.3...0.6)
            let blue = CGFloat.random(in: 0.2...0.5)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Red Hues":
            let red = CGFloat.random(in: 0.4...0.7)
            let green = CGFloat.random(in: 0.3...0.6)
            let blue = CGFloat.random(in: 0.2...0.5)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Purple Hues":
            let red = CGFloat.random(in: 0.6...1.0)
            let green = CGFloat.random(in: 0.0...0.3)
            let blue = CGFloat.random(in: 0.6...1.0)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Green Hues":
            let red = CGFloat.random(in: 0.0...0.2)
            let green = CGFloat.random(in: 0.6...1.0)
            let blue = CGFloat.random(in: 0.0...0.2)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        case "Grey Scale":
            let grayValue = CGFloat.random(in: 0...1)
            return Color(UIColor(red: grayValue, green: grayValue, blue: grayValue, alpha: opac))
        case "OLED":
            return Color(UIColor(red: 0, green: 0, blue: 0, alpha: opac))
        case "Gold":
            let red = CGFloat.random(in: 0.8...1.0)
            let green = CGFloat.random(in: 0.6...0.8)
            let blue = CGFloat.random(in: 0.0...0.2)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        default:
            let red = CGFloat.random(in: 0.7...1.0)
            let green = CGFloat.random(in: 0.0...0.2)
            let blue = CGFloat.random(in: 0.0...0.2)
            return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
        }
    }
    
    static func randomGradient(Palette: String = "Chromatic", opac: CGFloat = 1.0, cycle: Int = 1) -> LinearGradient { if Palette.caseInsensitiveCompare("Gold") == .orderedSame {
        let randomGold = self.randomColor(Palette: Palette, opac: opac, cycle: cycle)
        let darkGoldOrBlack = Bool.random() ? Color(UIColor(red: 0.6, green: 0.4, blue: 0.0, alpha: 1.0)) : Color.black
               return LinearGradient(gradient: Gradient(colors: [randomGold, darkGoldOrBlack]), startPoint: .leading, endPoint: .trailing)
    }
        else{
            let startColor = randomColor(Palette: Palette, opac: opac, cycle: cycle)
            let endColor = randomColor(Palette: Palette, opac: opac, cycle: cycle)
            return LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing)
        }
    }
    
    
    
    
}
    


