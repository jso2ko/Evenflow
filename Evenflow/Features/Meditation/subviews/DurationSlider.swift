import SwiftUI

struct DurationSlider: View {
    @Environment(MeditationStore.self) var store
    
    var body: some View {
        @Bindable var store = store
        Slider(value: $store.minutesLeft, in: 1...15, step: 1)
            .padding(.vertical, Constant.sliderPadding)
            .tint(.yellow)
            .disabled(store.isTimerRunning)
            .animation(.easeInOut, value: store.minutesLeft)
    }
}
