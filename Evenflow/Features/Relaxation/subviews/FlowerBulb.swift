import SwiftUI

struct FlowerBulb: View {
    @Environment(RelaxationStore.self) var store
    
    var body: some View {
        Group {
            ForEach(store.petals) { petal in
                Image.petal
                    .resizedFrame(width: Constant.petalWidth)
                    .oscillateFX(
                        forward: petal.clockwiseDirection,
                        reverse: petal.counterclockwise,
                        state: store.isImageAnimating
                    )
            }
        }
    }
}

// MARK: - Modifiers

private extension View {
    func oscillateFX(forward: Double, reverse: Double, state: Bool) -> some View {
        self.rotationEffect(.degrees(state ? forward : reverse), anchor: .bottom)
            .swapAnimation(state: state)
    }
}
