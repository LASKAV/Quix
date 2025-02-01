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

// MARK: Button Style Add
struct ButtonStyleAdd: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image.plus
            .resizable()
            .frame(width: 40, height: 40)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.appAccent, .clear)
    }
}
