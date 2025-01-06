import SwiftUI
import SwiftData

struct ScreenManager: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]

    var body: some View {
    
//        if let user = users.first, user.onboardingCompleted {
//            CardViewManager()
//        } else {
//            OnboardingItemsView()
//        }
        OnboardingScreen()
    }
}
