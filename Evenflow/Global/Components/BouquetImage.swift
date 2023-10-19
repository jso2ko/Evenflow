import SwiftUI

struct BouquetImage: View {
    let angle: Double
    
    var body: some View {
        Image.bouquet
            .fitted()
            .frame(width: Constant.bouquetWidth, height: Constant.bouquetHeight)
            .rotationEffect(.degrees(angle))
    }
}
