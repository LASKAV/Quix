import SwiftUI
import SwiftData

struct ContentManagerView: View {
    
    @Query private var user: [User]
    @Query private var accounts: [Account]

    var body: some View {
        NavigationStack {
            switch user.isEmpty {
            case true:
                OnboardingScreen()
            case false:
                if accounts.isEmpty {
                    AccountSetupView()
                } else {
                    ScreenManagerView()
                }
            }
        }
    }
}

