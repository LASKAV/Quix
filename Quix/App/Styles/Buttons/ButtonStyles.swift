import SwiftUI

struct OnbordingExtraButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .heavy, design: .default))
            .foregroundStyle(Color.white)
            .frame(maxWidth: 166, maxHeight: 50)
            .background(Color.blueIce)
            .clipShape(RoundedCorner(radius: 20))
    }
}
