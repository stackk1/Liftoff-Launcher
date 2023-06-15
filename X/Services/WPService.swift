//
//  WPService.swift
//  X
//
//  Created by Andrew on 2023-06-11.
//

import Foundation

class WPService:ObservableObject {
    @Published var wallpaper = false
    @Published var wallpaperImage = "Space"
    @Published var theme = "Pastel"
    @Published var transparancy = 0.9
   
}
