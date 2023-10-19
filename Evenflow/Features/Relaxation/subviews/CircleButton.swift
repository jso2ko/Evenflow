import SwiftUI

struct CircleButton: View {
    @Environment(NavRouter.self) var router
    
    var body: some View {
        Button(action: router.exitScreen) {
            Image(systemName: .circlePathIcon)
                .foregroundStyle(.mediumBlue)
                .font(.system(.largeTitle, weight: .bold))
                .frame(width: Constant.circleSize, height: Constant.circleSize)
                .background(Circle().fill(.transparentWhite))
        }
    }
}
