import SwiftUI

struct MeditationView: View {
    @State private var store = MeditationStore()
    
    var body: some View {
        ZStack {
            MixedGradient(colors: [.darkBlue, .mediumBlue, .lightBlue])
            VStack(spacing: Constant.meditationSpacing) {
                Spacer()
                CartoonImage()
                Spacer()
                TimerDisplay()
                DurationSlider()
                SettingsPanel()
                Spacer()
            }
            .padding(.horizontal, Constant.meditationPadding)
        }
        .environment(store)
        .onReceive(store.timer) { _ in
            store.updateCountdown()
        }
    }
}
