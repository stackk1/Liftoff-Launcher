//
//  WPService.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//

import Foundation
import SwiftUI

class ThemeService:ObservableObject {
    @Published var wallpaper = false
    @Published var wallpaperImage = "Black"
    @Published var theme = "Pastel"
    @Published var iconColor = "White"
    @Published var labelColor = "White"
    @Published var discoColor = "Chromatic"
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
            return ColorService.randomColor(Palette: self.theme)
        }
        else{
            return Color(.white)
        }
    }
}

