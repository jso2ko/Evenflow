import SwiftUI

struct CartoonImage: View {
    @Environment(MeditationStore.self) var store
    
    var body: some View {
        Group {
            Image.fox
                .fitted()
                .padding()
                .figureShadow()
                .levitateFX(state: store.isCartoonAnimating)
        }
        .popFX(state: store.isCartoonAnimating)
        .onAppear(perform: store.beginAnimation)
    }
}

// MARK: - Modifiers

private extension View {
    func figureShadow() -> some View {
        self.shadow(color: .transparentBlack, radius: 0, x: 0, y: 8)
    }
    
    func levitateFX(state: Bool, animationOffset: CGFloat = -24) -> some View {
        self.offset(y: state ? abs(animationOffset) : animationOffset)
            .animation(.easeInOut(duration: 4).repeatForever(), value: state)
    }
    
    func popFX(state: Bool) -> some View {
        self.scaledOpacity(state: state)
            .animation(.easeOut(duration: 0.4), value: state)
    }
}
