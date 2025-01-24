import SwiftUI
import SwiftData

@main
struct QuixApp: App {
    var body: some Scene {
        WindowGroup {
            ScreenManager()
                .modelContainer(for: [User.self, Account.self, Transaction.self])
        }
    }
}
