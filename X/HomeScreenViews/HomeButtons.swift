//
//  HomeButtons.swift
//  X
//
//  Created by Andrew on 2023-06-05.
//

import SwiftUI

struct HomeButtons: View {
    var body: some View {
        Rectangle()
            .foregroundColor(RandomColour.colorView())
            .cornerRadius(25)
            .frame(width: 85, height: 85)
    }
}

struct HomeButtons_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtons()
    }
}
