//
//  XApp.swift
//  X
//
//  Created by Andrew on 2023-06-03.
//

import SwiftUI

@main
struct XApp: App {
    var body: some Scene {
        WindowGroup {
            LauncherView()
                .environmentObject(GameModel())
                .environmentObject(BookModel())
                .environmentObject(RecipeModel())
                .environmentObject(ContentModel())
                .environmentObject(WPService())
                .environmentObject(NavigationService())
                .environmentObject(DiceUIService())
                .environmentObject(ColourService())
        }
    }
}


