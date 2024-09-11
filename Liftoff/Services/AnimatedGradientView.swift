import SwiftUI

struct AnimatedGradientView: View {
    var palette: String = "Chromatic"
    var opac: CGFloat = 1
    @State private var gradientOffset: CGFloat = -1.0 // Start off-screen (top)
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        ColorService.randomColor(Palette: palette, opac: opac),
                        ColorService.randomColor(Palette: palette, opac: opac)
                    ]),
                    startPoint: .top,
                    endPoint: UnitPoint(x: 0.5, y: gradientOffset)
                )
            )
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
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

