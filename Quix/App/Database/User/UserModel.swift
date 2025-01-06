import Foundation
import SwiftData

// MARK: User Model
@Model
final class User {
    @Attribute(.unique) var id: UUID = UUID()
    var language: String?
    var accounts: [Account] = []
    var passcode: String?
    var isPasscodeEnabled: Bool = false
    var onboardingCompleted: Bool = false
    var faceIdEnabled: Bool = false
    
    init() {}
    deinit {print("User deleted: \(id) ")}
    
    func configure(passcode: String, language: String) {
        self.passcode = passcode
        self.language = language
    }
    
    
}

@Observable
class UserViewModel {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func initUser() {
        do {
            let existingUsers = try modelContext.fetch(FetchDescriptor<User>())
            if existingUsers.isEmpty {
                let user = User()
                modelContext.insert(user)
                try modelContext.save()
                printAllUsers()
                print("User created successfully.")
            } else {
                print("User already exists.")
            }
        } catch {
            print("Error initializing user: \(error.localizedDescription)")
        }
    }
    
    func deleteUser() {
        do {
            let users = fetchUsers()
            if let user = users.first {
                modelContext.delete(user)
                try modelContext.save()
                print("User deleted successfully.")
            } else {
                print("No user found to delete.")
            }
        } catch {
            print("Error deleting user: \(error.localizedDescription)")
        }
    }

    func fetchUsers() -> [User] {
        do {
            let users = try modelContext.fetch(FetchDescriptor<User>())
            return users
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return []
        }
    }
    
    func printAllUsers() {
        let users = fetchUsers()
        if users.isEmpty {
            print("No users found.")
        } else {
            for user in users {
                print("""
                    ID: \(user.id)
                    Language: \(user.language ?? "Not set")
                    Passcode: \(user.passcode ?? "Not set")
                    Onboarding: \(user.onboardingCompleted)
                    Face ID: \(user.faceIdEnabled)
                    Accounts: \(user.accounts.count)
                    """)
            }
        }
    }
    
}

