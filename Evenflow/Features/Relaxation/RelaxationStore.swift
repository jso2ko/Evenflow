import Observation

@Observable class RelaxationStore {
    var isGuideInhaling = true
    var isGuideExhaling = false
    var isImageAnimating = false
    
    @ObservationIgnored let petals: [Petal] = [
        .init(clockwiseDirection: -24, counterclockwise: -4),
        .init(clockwiseDirection: 0, counterclockwise: 0),
        .init(clockwiseDirection: 24, counterclockwise: 4),
        .init(clockwiseDirection: -48, counterclockwise: -8),
        .init(clockwiseDirection: 48, counterclockwise: 8)
    ]
}

// MARK: - Functions

extension RelaxationStore {
    func startSequence() {
        isGuideInhaling.toggle()
        isGuideExhaling.toggle()
        isImageAnimating.toggle()
        Sound.bell.play()
    }
}
