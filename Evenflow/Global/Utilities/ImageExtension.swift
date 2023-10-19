import SwiftUI

extension Image {
    static let bouquet = Image("bouquet")
    static let fox = Image("fox")
    static let petal = Image("petal")
    static let smoke = Image("smoke")
}

// MARK: - Modifiers

extension Image {
    func fitted() -> some View {
        self.resizable()
            .scaledToFit()
    }
    
    func resizedFrame(width: CGFloat, height: CGFloat = 128) -> some View {
        self.resizable()
            .frame(width: width, height: height)
    }
}
