import Foundation
import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) var id: UUID

    var name: String
    var currency: String
    var total: Double
    var cardColor: String
    
    @Relationship var transactions: [Transaction]? = []
    
    // Add indexe for name
    #Index<Account>([\.name])
    
    init(name: String = "",
         currency: String = "USD",
         cardColor: String) {
        self.id = UUID()
        self.name = name
        self.currency = currency
        self.cardColor = cardColor
        self.total = 0.0
    }
    
}

@Observable
class AccountViewModel {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    static func formatAmount(_ total: Double, for currency: String) -> String {
        return total.formatted(.currency(code: currency).presentation(.narrow))
    }
}
