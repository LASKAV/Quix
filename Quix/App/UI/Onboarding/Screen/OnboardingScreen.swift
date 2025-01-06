import SwiftUI
import SwiftData

struct OnboardingScreen: View {
    var onboardingiItems = Onboarding.onData
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
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Button {
            let userViewModel = UserViewModel(modelContext: modelContext)
//            userViewModel.deleteUser()
            userViewModel.initUser()
            userViewModel.printAllUsers()
            
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
    OnboardingScreen()
}
