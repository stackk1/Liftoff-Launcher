//
//  WPService.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//

import Foundation
import SwiftUI

class WPService:ObservableObject {
    @Published var wallpaper = false
    @Published var wallpaperImage = "Space"
    @Published var theme = "Chromatic"
    @Published var iconColor = "White"
    @Published var labelColor = "White"
    @Published var transparancy: CGFloat = 1.0
    
    func setLabelColor() -> Color{
        if self.labelColor.caseInsensitiveCompare("Black") == .orderedSame{
            return Color(.black)
        }
        else if self.labelColor.caseInsensitiveCompare("None") == .orderedSame{
            return Color(.clear)
        }
        else{
            return Color(.white)
        }
    }
    func setIconColor() -> Color{
        if self.iconColor.caseInsensitiveCompare("Black") == .orderedSame{
            return Color(.black)
        }
        else if self.iconColor.caseInsensitiveCompare("None") == .orderedSame{
            return Color(.clear)
        }
        else if self.iconColor.caseInsensitiveCompare("Theme") == .orderedSame{
            return ColourService.randomColor(Palette: self.theme)
        }
        else{
            return Color(.white)
        }
    }
}

