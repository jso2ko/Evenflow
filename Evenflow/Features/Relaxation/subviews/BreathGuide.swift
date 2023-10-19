import SwiftUI

struct BreathGuide: View {
    @Environment(RelaxationStore.self) var store
    
    var body: some View {
        Group {
            InstructionText(
                color: .green,
                text: .inhaleText,
                state: store.isGuideInhaling
            )
            
            InstructionText(
                color: .orange,
                text: .exhaleText,
                state: store.isGuideExhaling
            )
        }
    }
}
