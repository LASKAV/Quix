import SwiftUI
import SwiftData

@main
struct QuixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentManagerView()
                .modelContainer(for: [User.self, Account.self, Transaction.self])
        }
    }

    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    
}


