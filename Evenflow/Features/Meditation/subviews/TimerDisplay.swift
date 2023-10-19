import SwiftUI

struct TimerDisplay: View {
    @Environment(MeditationStore.self) var store
    
    var body: some View {
        @Bindable var store = store
        Text(store.timeDisplay)
            .font(.system(size: Constant.timerFontSize, weight: .medium))
            .alert(.completedMessage, isPresented: $store.isAlertShowing) {
                Button(.completedAction, role: .cancel) {
                    store.resetTimer()
                }
            }
    }
}
