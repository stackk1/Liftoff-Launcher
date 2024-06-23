//
//  ButtonBackgroundView.swift
//  Learning App
//
//  Created by Andrew on 2023-06-12.
//

import SwiftUI

struct ButtonBackgroundView: View {
    
    var color = Color.green
    var frameHeight = 48.0
    var shaddow = 5.0
    
    var body: some View {
        Rectangle()
            .cornerRadius(10)
            .foregroundColor(color)
            .shadow(radius: 5)
            .frame(height: frameHeight)
    }
}

struct ButtonBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBackgroundView()
    }
}
