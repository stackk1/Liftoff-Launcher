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
   
//    func BWC(){
//            if iconColor.caseInsensitiveCompare("Black") == .orderedSame{
//                return Color(.black)
//            }
//            else if iconColor.caseInsensitiveCompare("None") == .orderedSame{
//                return Color(.clear)
//            }
//            else{
//                return Color(.white)
//            }
//
//    }
}

