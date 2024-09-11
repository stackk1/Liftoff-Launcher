//
//  XApp.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

@main
struct Liftoff: App {
    var body: some Scene {
        WindowGroup {
            LauncherView()
                .environmentObject(GameModel())
                .environmentObject(BookModel())
                .environmentObject(RecipeModel())
                .environmentObject(ContentModel())
                .environmentObject(ThemeService())
                .environmentObject(NavigationService())
                .environmentObject(DiceUIService())
                .environmentObject(ColorService())
                .environmentObject(WeatherModel())
        }
    }
}


