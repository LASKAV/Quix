import SwiftUI

// MARK: Onboarding View
struct OnboardingCardView: View {
    
    var onboarding: Onboarding
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Text(onboarding.title)
                .font(.system(size: 25, weight: .heavy))
                .foregroundStyle(Color.accentText)
                .lineSpacing(5)
                .frame(maxWidth: 270)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding([.bottom], 35)
                .padding([.top], 50)

            Text(onboarding.description)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.accentText)
                .lineSpacing(5)
                .frame(maxWidth: 340)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
        }
    }
}

