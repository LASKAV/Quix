import SwiftUI

// MARK: Onboarding Model
struct Onboarding: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    
    static let onData: [Onboarding] = [
        Onboarding(
            title: "Manage",
            description: "Track your income and expenses to stay on top of your budget."),
        
        Onboarding(
            title: "Analysis",
            description: "Charts, categories, and comprehensive statistics for managing your finances."),
        
        Onboarding(
            title: "Detail and style",
            description: "View your transactions for each account with personalized cards.")
    ]
}
