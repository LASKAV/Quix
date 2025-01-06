import SwiftUI
import SwiftData

@main
struct QuixApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: User.self, Account.self, Transaction.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ScreenManager()
                .modelContainer(container)
        }
    }
}
