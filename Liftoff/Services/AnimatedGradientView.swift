import SwiftUI

struct AnimatedGradientView: View {
    var palette: String = "Chromatic"
    var opac: CGFloat = 1
    @State private var gradientOffset: CGFloat = -1.0 // Start off-screen (top)
    
    var body: some View {
        Rectangle()
            .fill(
                ColourService.randomGradient(Palette: palette, opac: opac, cycle: 1)
            )
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                ColourService.randomColor(Palette: palette, opac: opac),
                                ColourService.randomColor(Palette: palette, opac: opac)
                            ]),
                            startPoint: .top,
                            endPoint: UnitPoint(x: 0.5, y: gradientOffset)
                        )
                    )
            )
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    gradientOffset = 2.0 // Cascades beyond the bottom for continuous effect
                }
            }
    }
}
