//
//  RecipeSettingsView.swift
//  Liftoff
//
//  Created by Andrew Stack on 2024-07-17.
//

import SwiftUI

struct RecipeSettingsView: View {
    @EnvironmentObject var rm: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Text("Recipe Settings")
                .font(.title)
            Divider()
                .padding(.bottom)
            
            Toggle(
                isOn: $rm.background,
                label: {
                    Text("Background")
                })
                Picker("Wallpaper Image", selection: $rm.backgroundImage){
                    Text("Wood").tag("Wood")
                    Text("Cartoon Wood").tag("Cartoon Wood")
                    Text("Plain").tag("Plain")
                    Text("Cloth").tag("Cloth")
                    Text("Space").tag("Space")
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.top, 0)
        }
    }
}
