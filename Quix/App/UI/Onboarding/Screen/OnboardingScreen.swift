import SwiftUI
import SwiftData

struct OnboardingScreen: View {
    
    var onboardingiItems = Onboarding.onData
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    ForEach(onboardingiItems) { item in
                        OnboardingCardView(onboarding: item)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .blueIce
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.customGray
                }
                ContinueButton()
            }
        }
        .modelContainer(for: User.self)
    }
}

// MARK: Continue Button
struct ContinueButton: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query private var user: [User]
    @State private var navigate = false
    
    var body: some View {
        VStack {
            Button {
                switch user.isEmpty {
                case true:
                    print("user.isEmpty true")
                    let newUser = User()
                    newUser.onboardingCompleted = true
                    context.insert(newUser)
                    try? context.save() 
                    navigate = true
                case false:
                    print("user.isEmpty false")
                    navigate = true
                }
            } label: {
                Text("Continue")
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundStyle(Color.white)
                    .padding(EdgeInsets(top: 13, leading: 37, bottom: 13, trailing: 37))
            }
            .buttonStyle(OnbordingExtraButton())
            .navigationDestination(isPresented: $navigate) {
                AccountSetupView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    OnboardingScreen()
        .modelContainer(for: User.self)
}
