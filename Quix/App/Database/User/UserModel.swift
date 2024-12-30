import Foundation
import SwiftData

// MARK: User Model
@Model
final class User {
    
    // Singleton
    static let shared = User()
    private init() {}
    
    @Attribute(.unique) public var id = UUID().uuidString
    
    public var currency: String?
    public var language: String?
    
    public var account: [Account]?
    public var passcode: String?
    
    public var isPasscode: Bool?
    public var OnBording: Bool?
    public var faceId: Bool?
    
    func configure(passcode: String, currency: String, language: String) {
            self.passcode = passcode
            self.currency = currency
            self.language = language
        }
    
}

