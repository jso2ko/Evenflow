import SwiftUI

struct InstructionText: View {
    let color: Color
    let text: String
    let state: Bool
    
    var body: some View {
        Text(text.capitalized)
            .foregroundStyle(color)
            .font(.custom(.instructionFont, size: Constant.instructionFontSize))
            .scaledOpacity(state: state, isReversed: true)
            .offset(y: Constant.instructionOffset)
            .swapAnimation(state: state)
    }
}
