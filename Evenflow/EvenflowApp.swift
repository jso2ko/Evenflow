import SwiftUI

@main
struct EvenflowApp: App {
    @State private var router = NavRouter()
    
    var body: some Scene {
        WindowGroup {
            if router.isMeditationActive {
                MeditationView()
                    .environment(router)
                    .foregroundStyle(.white)
            } else {
                RelaxationView()
                    .environment(router)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
