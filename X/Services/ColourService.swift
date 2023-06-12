//
//  RandomColor.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI
import Foundation


struct ColourService {
    static func randomRGB(opac: Double = 0.9) -> Color {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

    return Color(UIColor(red: red, green: green, blue: blue, alpha: opac))
           
        }

}
let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]
