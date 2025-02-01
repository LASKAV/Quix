import Foundation
import SwiftData

// MARK: User Model
@Model
final class User {
    @Attribute(.unique) var id: UUID = UUID()
    var language: String?
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

