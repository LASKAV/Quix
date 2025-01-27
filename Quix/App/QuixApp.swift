import SwiftUI
import SwiftData

@main
struct QuixApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingManager()
                .modelContainer(for: [User.self, Account.self, Transaction.self])
        }
    }
}
