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
        .modelContainer(for: User.self) // ✅ Устанавливаем modelContext в Environment
    }
}

// MARK: Continue Button
struct ContinueButton: View {
    @Environment(\.modelContext) private var context
    @State private var navigateToAccountSetup = false
    @Query private var users: [User] // ✅ `user` → `users`, так как `@Query` возвращает массив

    var body: some View {
        VStack {
            Button {
                if let existingUser = users.first { // ✅ Используем `users.first`
                    if existingUser.onboardingCompleted {
                        navigateToAccountSetup = true
                    } else {
                        existingUser.onboardingCompleted = true
                        navigateToAccountSetup = true
                    }
                } else {
                    let newUser = User()
                    newUser.onboardingCompleted = true
                    context.insert(newUser)
                    navigateToAccountSetup = true
                }
            } label: {
                Text("Continue")
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundStyle(Color.white)
                    .padding(EdgeInsets(top: 13, leading: 37, bottom: 13, trailing: 37))
            }
            .buttonStyle(OnbordingExtraButton())
            .navigationDestination(isPresented: $navigateToAccountSetup) {
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

