import Observation

@Observable class NavRouter {
    var isMeditationActive = true
    
    func exitScreen() {
        isMeditationActive.toggle()
    }
}
