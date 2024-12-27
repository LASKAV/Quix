import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ContinueButton()
        }
    }
}


// MARK: Continue Button
struct ContinueButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Continue")
                .font(.system(size: 20,
                    weight: .heavy, design: .default))
                .foregroundStyle(Color.white)
                .padding(EdgeInsets(
                    top: 13, leading: 37,
                    bottom: 13, trailing: 37))
        }
        .buttonStyle(OnbordingExtraButton())
    }
}

#Preview {
    WelcomeScreen()
}
