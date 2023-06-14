//
//  SwiftUIView.swift
//  X
//
//  Created by Andrew on 2023-06-12.
//

import SwiftUI

struct HomeButton: View {
    @EnvironmentObject var nav: NavigationService
    
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
                    //ButtonBackgroundView(color: .black)
                    Image(systemName: "square.circle.fill")
                        .font(.system(size:40))
                        .foregroundColor(.white)
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
