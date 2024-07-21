//
//  GradientButton.swift
//  Liftoff
//
//  Created by Andrew Stack on 2024-07-20.
//

import SwiftUI

struct GradientButtonStyle:ButtonStyle{
    
    let gradientColours = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink])
    @State var isAnimated = false
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack{
                configuration.label.font(.title2).bold()
                    .foregroundStyle(.white)
                    .frame(width: 280, height: 60)
                    .background(.gray.opacity(0.5), in: .rect(cornerRadius: 20))
                    .overlay{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(AngularGradient.init(gradient: gradientColours, center: .center, angle: .degrees(isAndimated ? 360 : 0)), lineWidth: 3)
                        }
                    }
            }.onAppear(){
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    isAnimated = true
                }
            }
    }
}
