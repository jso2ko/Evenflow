import SwiftUI

struct SettingsPanel: View {
    @Environment(MeditationStore.self) var store
    @Environment(NavRouter.self) var router
    
    var body: some View {
        HStack(spacing: Constant.settingsSpacing) {
            if !store.isTimerRunning {
                CapsuleButton(
                    icon: Control.start.label.icon,
                    text: Control.start.label.text,
                    action: store.startTimer
                )
                
                CapsuleButton(
                    icon: Control.relax.label.icon,
                    text: Control.relax.label.text,
                    action: router.exitScreen
                )
            } else {
                CapsuleButton(
                    icon: Control.stop.label.icon,
                    text: Control.stop.label.text,
                    action: store.resetTimer,
                    isTimerActive: true
                )
            }
        }
    }
}
