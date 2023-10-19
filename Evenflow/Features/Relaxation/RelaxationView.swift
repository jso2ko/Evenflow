import SwiftUI

struct RelaxationView: View {
    @State private var store = RelaxationStore()
    
    var body: some View {
        ZStack {
            MixedGradient(colors: [.darkGrey, .mediumGrey])
            ZStack {
                BreathGuide()
                SmokeVent()
                FlowerBulb()
                BaseWrapper()
            }
            .offset(y: Constant.relaxationOffset)
        }
        .environment(store)
        .onAppear(perform: store.startSequence)
        .overlay(CircleButton(), alignment: .bottom)
    }
}
