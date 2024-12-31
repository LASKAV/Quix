import Foundation
import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) public var id: UUID

    public var name: String
    public var currency: String
    public var total: Double
    public var transactions: [Transaction]
    
    // Add indexe for name
    #Index<Account>([\.name])
    
    init(name: String = "",
         transactions: [Transaction] = [],
         currency: String = "USD",
         card: Card) {
        self.id = UUID()
        self.name = name
        self.currency = currency
        self.transactions = transactions
        self.total = transactions.reduce(0) { $0 + $1.amount }
    }
    
}
