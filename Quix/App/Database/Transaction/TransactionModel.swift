import Foundation
import SwiftData

// MARK: Transaction Model
@Model
final class Transaction {
    
    @Attribute(.unique) var id: UUID
    
    var name: String
    var category: String
    var amount: Double
    var date: Date
    
    // Add indexe for name
    #Index<Transaction>([\.name], [\.category])
    
    var account: [Account]
    
    var isEdited: Bool
    var isExpense: Bool
    var isTransfer: Bool
    
    init(name: String = "",
         category: String = "",
         amount: Double = 0,
         date: Date = Date(),
         account: [Account] = [],
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
