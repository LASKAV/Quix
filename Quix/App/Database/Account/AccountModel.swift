import Foundation
import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) public var id: UUID

    public var name: String?
    public var transactions: [Transaction]?
    
    // Add indexe for name
    #Index<Account>([\.name])
    
    init(name: String? = nil,
         transactions: [Transaction]? = nil) {
        self.id = UUID()
        self.name = name
        self.transactions = transactions
    }
    
}
