import Foundation
import SwiftData

// MARK: Transaction Model
@Model
final class Transaction {
    
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var category: Category
    var amount: Double
    var date: Date
    var isEdited: Bool
    var isExpense: Bool
    var isTransfer: Bool
        
    init(name: String,
         category: Category,
         amount: Double,
         date: Date = Date(),
         isExpense: Bool) {
        
        self.id = UUID()
        self.name = name
        self.category = category
        self.amount = amount
        self.date = date
        self.isEdited = false
        self.isExpense = isExpense
        self.isTransfer = false
    }
    
}
