import SwiftUI

struct MixedGradient: View {
    let colors: [Color]
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
