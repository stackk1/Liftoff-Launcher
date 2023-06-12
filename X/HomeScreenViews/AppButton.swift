//
//  HomeButtons.swift
//  X
//
//  Created by Andrew on 2023-06-05.
//

import SwiftUI

struct AppButton<Content: View>: View {
    @EnvironmentObject var nav: NavigationService
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
            tag: appLabel,
            selection: $nav.currentApp,
            label: {
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(ColourService.randomRGB())
                            .cornerRadius(20)
                            .frame(width: 75, height: 75)
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            
                    }
                        Text(appLabel)
                    
                }
                .foregroundColor(.white)
                })
            }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(app: MapView(), image: "map", label: "Map")
    }
}

