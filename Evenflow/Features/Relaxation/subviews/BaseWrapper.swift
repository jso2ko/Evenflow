import SwiftUI

struct BaseWrapper: View {
    @Environment(RelaxationStore.self) var store
    
    var body: some View {
        Group {
            BouquetImage(angle: Constant.innerBaseDegrees)
                .embedFX(state: store.isImageAnimating)
            
            BouquetImage(angle: Constant.outerBaseDegrees)
                .glowFX(state: store.isImageAnimating)
        }
    }
}

// MARK: - Modifiers

private extension View {
    func embedFX(state: Bool) -> some View {
        self.offset(x: -24, y: 92)
            .magnifiedScale(state: state, units: 1.08)
            .swapAnimation(state: state)
    }
    
    func glowFX(state: Bool) -> some View {
        self.offset(x: -20, y: 96)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .magnifiedScale(state: state, units: 1.04)
            .hueRotation(Angle(degrees: state ? -60 : 300))
            .swapAnimation(state: state)
    }
}
