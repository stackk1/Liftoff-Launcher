import SwiftUI

struct AnimatedGradientView: View {
    var palette: String = "Chromatic"
    var opac: CGFloat = 1
    @State private var gradientOffset: CGFloat = -1.0 // Start off-screen (top)
    
    var body: some View {
        let startColor =  ColorService.randomColor(Palette: palette, opac: opac)
        let endColor =  ColorService.randomColor(Palette: palette, opac: opac)
        
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        startColor,
                        endColor,
                        startColor
                    ]),
                    startPoint: .top,
                    endPoint: UnitPoint(x: 0.5, y: gradientOffset)
                )
            )
            .onAppear {
                withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                    gradientOffset = 2.0 // Cascades beyond the bottom for continuous effect
                }
            }
    }
}

struct AnimatedGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGradientView()
            .environmentObject(ColorService())
    }
}

