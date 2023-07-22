//
//  HomeButtons.swift
//  X
//
//  Created by Andrew on 2023-06-05.
//

import SwiftUI

struct AppButton<Content: View>: View {
    @EnvironmentObject var wp: WPService
    @EnvironmentObject var nav: NavigationService
    @ViewBuilder var appView: Content
    @ViewBuilder var imageName: String
    @ViewBuilder var appLabel: String
    var updateColors: Int = 0
    
    
    init(app: Content, image: String, label: String, updateColors: Int = 0) {
        self.appView = app
        self.imageName = image
        self.appLabel = label
        self.updateColors = updateColors
        }
        
    var body: some View {
        
        NavigationLink(
            destination:
                appView
                .navigationBarHidden(true),
            tag: appLabel,
            selection: $nav.currentApp,
            label: {
                VStack{
                    ZStack{
                        if wp.iconColor.caseInsensitiveCompare("None") == .orderedSame{
                            Rectangle()
                                .reverseMask{(Image(systemName: imageName).resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45))}
                                .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy, cycle: updateColors))
                                .cornerRadius(20)
                                .frame(width: 72, height: 72)
                                
                        }
                        else{
                            Rectangle()
                                .foregroundColor(ColourService.randomColor(Palette: wp.theme, opac: wp.transparancy))
                                .cornerRadius(20)
                                .frame(width: 72, height: 72)
                        }
                        let themeColour = wp.setIconColor()
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .foregroundColor(
                                themeColour
                            )
                        
                    }
                    Text(appLabel)
                        .foregroundColor({
                            if wp.labelColor.caseInsensitiveCompare("Black") == .orderedSame{
                                return Color(.black)
                            }
                            else if wp.labelColor.caseInsensitiveCompare("None") == .orderedSame{
                                return Color(.clear)
                            }
                            else{
                                return Color(.white)
                            }
                        }()
                        )
                }
                
            })
    }
}


//struct AppButton_Previews: PreviewProvider {
//    static var previews: some View {
//        AppButton(app: MapView(), image: "map", label: "Map")
//            .environmentObject(NavigationService())
//    }
//}

