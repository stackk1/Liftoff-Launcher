//
//  SwiftUIView.swift
//  X
//
//  Created by Andrew on 2023-06-12.
//

import SwiftUI

struct HomeButton: View {
    @EnvironmentObject var nav: NavigationService
    @EnvironmentObject var wp: ThemeService
    
    var body: some View {
        Button(
            action:{
                if nav.currentApp != nil {
                nav.currentApp = nil
            }
            else{
                nav.currentHomepage = 1
            }
            },
            label:{
                ZStack{
                    Image(systemName: "square.circle.fill")
                        .font(.system(size:40))
                        .foregroundColor(ColorService.randomColor(Palette: wp.theme))
                        .background(Color(.black))
                        .clipShape(Circle())
                }
            }
        )
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
