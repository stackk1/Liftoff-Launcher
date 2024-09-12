import SwiftUI

struct AnimatedGradientView: View {    @State private var gradientOffset: CGFloat = -1.0 // Start off-screen (top)
    @EnvironmentObject var ts: ThemeService
    var body: some View {
        let startColor =  ColorService.randomColor(Palette: ts.discoColor)
        let endColor =  ColorService.randomColor(Palette: ts.discoColor)
        
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
                withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
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

