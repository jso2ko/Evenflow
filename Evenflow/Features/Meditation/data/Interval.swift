import Foundation

enum Interval {
    case start
    case current(value: Float)
    case end
    
    var position: String {
        var minutes = 0
        
        switch self {
        case .start:
            minutes += Int(Constant.defaultMinutes)
        case let .current(value):
            minutes += Int(value)
        case .end:
            minutes += Constant.emptyNumber
        }
        
        return String(minutes) + .secondsMeter
    }
}
