import SwiftUI
import SwiftData

@main
struct QuixApp: App {
    
    // Dark mode preference
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
//            OnboardingManager()
            ScreenManagerView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .modelContainer(for: [User.self, Account.self, Transaction.self])
        }
    }
}

