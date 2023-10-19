import SwiftUI
import Observation

@Observable class MeditationStore {
    var isCartoonAnimating = false
    var isTimerRunning = false
    var isAlertShowing = false
    
    var minutesLeft = Constant.defaultMinutes {
        didSet { trackProgress() }
    }
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timeDisplay = Interval.start.position
    
    @ObservationIgnored private(set) var initialTime = Constant.emptyNumber
    @ObservationIgnored private(set) var endDate = Date()
}

// MARK: - Functions

extension MeditationStore {
    func configureDuration(value: Int) {
        minutesLeft = Float(value)
    }
    
    func trackProgress() {
        timeDisplay = Interval.current(value: minutesLeft).position
    }
    
    func toggleTimerActivity() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        isTimerRunning.toggle()
    }
    
    func beginAnimation() {
        withAnimation {
            isCartoonAnimating.toggle()
            Sound.chime.play()
        }
    }
    
    func startTimer() {
        initialTime = Int(minutesLeft)
        endDate = Date()
        toggleTimerActivity()
        endDate = Calendar.current.date(
            byAdding: .minute, value: Int(minutesLeft), to: endDate
        )!
    }
    
    func resetTimer() {
        configureDuration(value: initialTime)
        if !isAlertShowing { toggleTimerActivity() }
        trackProgress()
    }
    
    func updateCountdown() {
        guard isTimerRunning else { return }
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= TimeInterval(Constant.emptyNumber) {
            toggleTimerActivity()
            timeDisplay = Interval.end.position
            isAlertShowing.toggle()
            Sound.alarm.play()
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let minutes = Calendar.current.component(.minute, from: date)
        let seconds = Calendar.current.component(.second, from: date)
        
        configureDuration(value: minutes)
        timeDisplay = String(format: .timeFormat, minutes, seconds)
    }
}
