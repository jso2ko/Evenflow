import SwiftUI

struct SmokeVent: View {
    @Environment(RelaxationStore.self) var store
    
    var body: some View {
        Group {
            Image.smoke
                .resizedFrame(width: Constant.smokeWidth)
                .diffuseFX(state: store.isImageAnimating)
        }
        .outlineFX(state: store.isImageAnimating)
    }
}

// MARK: - Modifiers

private extension View {
    func diffuseFX(state: Bool) -> some View {
        self.offset(y: state ? 92 : 0)
            .swapAnimation(state: state)
            .blur(radius: state ? 1 : 60)
            .offset(y: state ? -48 : -96)
            .swapAnimation(state: state)
    }
    
    func outlineFX(state: Bool) -> some View {
        self.shadow(radius: state ? 20 : 0)
    }
}
