import SwiftUI

extension View {
    func scaledOpacity(state: Bool, isReversed: Bool = false) -> some View {
        self.opacity(isReversed ? (state ? 0 : 1) : (state ? 1 : 0))
            .scaleEffect(isReversed ? (state ? 0.1 : 1) : (state ? 1 : 0.6))
    }
    
    func magnifiedScale(state: Bool, units: CGFloat) -> some View {
        self.scaleEffect(state ? units : 1, anchor: .center)
    }
    
    func swapAnimation(state: Bool) -> some View {
        self.animation(
            .easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true),
            value: state
        )
    }
}
