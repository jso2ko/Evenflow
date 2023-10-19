import Foundation

enum Control: String {
    case start, relax, stop
    
    var label: (icon: String, text: String) {
        var symbol = ""
        var title = self.rawValue
        
        switch self {
        case .start:
            symbol += .playIcon
        case .relax:
            symbol += .windIcon
        case .stop:
            symbol += .stopIcon
            title += .stopTextConcat
        }
        
        return (icon: symbol, text: title)
    }
}
