import SwiftUI

struct CapsuleButton: View {
    let icon: String
    let text: String
    let action: () -> Void
    var isTimerActive = false
    
    var body: some View {
        Button(action: action) {
            Label(text.capitalized, systemImage: icon)
                .padding(Constant.capsulePadding)
                .font(.system(.title3, design: .rounded, weight: .bold))
                .frame(maxWidth: isTimerActive ? .infinity : Constant.capsuleWidth)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}
