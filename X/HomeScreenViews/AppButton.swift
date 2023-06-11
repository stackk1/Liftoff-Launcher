//
//  HomeButtons.swift
//  X
//
//  Created by Andrew on 2023-06-05.
//

import SwiftUI

struct AppButton<Content: View>: View {
    @ViewBuilder var appView: Content
    @ViewBuilder var imageName: String
    @ViewBuilder var appLabel: String
    
    init(app: Content, image: String, label: String) {
        self.appView = app
        self.imageName = image
        self.appLabel = label
        
    }
    
    var body: some View {
        NavigationLink(
            destination:
                appView,
            label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(ColourService.randomRGB())
                        .cornerRadius(25)
                        .frame(width: 85, height: 85)
                    
                    VStack{
                        Image(systemName: imageName)
                            .imageScale(.large)
                        Text(appLabel)
                    }
                    .foregroundColor(.white)
                }
                })
            }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(app: MapView(), image: "map", label: "Map")
    }
}

