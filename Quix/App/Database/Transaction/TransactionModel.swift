import Foundation
import SwiftData

// MARK: Transaction Model
@Model
final class Transaction {
    
    @Attribute(.unique) public var id: UUID
    
    public var name: String?
    public var category: String?
    public var amount: Double?
    public var date: Date?
    
    // Add indexe for name
    #Index<Transaction>([\.name], [\.category])
    
    public var account: [Account]?
    
    public var isEdited: Bool
    public var isExpense: Bool
    public var isTransfer: Bool
    
    init(name: String? = nil,
         category: String? = nil,
         amount: Double? = nil,
         date: Date = Date(),
         account: [Account]? = nil,
         isExpense: Bool) {
        
        self.id = UUID()
        self.name = name
        self.category = category
        self.amount = amount
        self.date = date
        self.account = account
        self.isEdited = false
        self.isExpense = isExpense
        self.isTransfer = false
    }
    
}
