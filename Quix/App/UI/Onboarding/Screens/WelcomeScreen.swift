import SwiftUI

struct OnboardingItem: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    
    static let OnData: [OnboardingItem] = [
        OnboardingItem(
            image: "receipt",
            title: "Manage",
            description: "Track your income and expenses to stay on top of your budget."),
        
        OnboardingItem(
            image: "receipt",
            title: "Analysis",
            description: "Charts, categories, and comprehensive statistics for managing your finances."),
        
        OnboardingItem(
            image: "receipt",
            title: "Detail and style",
            description: "View your transactions for each account with personalized cards.")
    ]
}
struct OnboardingCardView: View {
    
    var onboarding: OnboardingItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: onboarding.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))

            Text(onboarding.title)
                .font(.system(size: 25))
                .foregroundStyle(Color.accentText)
                .fontWeight(.heavy)
                .lineSpacing(5)
                .frame(maxWidth: 270)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding([.bottom], 35)
                .padding([.top], 50)

            Text(onboarding.description)
                .font(.system(size: 15))
                .foregroundStyle(Color.accentText)
                .fontWeight(.medium)
                .lineSpacing(5)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
        }
    }
}

struct OnbordingManager: View {
    var onboardingiItems = OnboardingItem.OnData
    var body: some View {
        TabView {
            ForEach(onboardingiItems) { item in
                OnboardingCardView(onboarding: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            UIPageControl.appearance()
                .currentPageIndicatorTintColor = .blueIce
            UIPageControl.appearance()
                .pageIndicatorTintColor = UIColor.customGray
        }
        
        ContinueButton()
    }
}

// MARK: Continue Button
struct ContinueButton: View {
    var body: some View {
        Button {
            print("Onboarding Completed")
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
    OnbordingManager()
}
