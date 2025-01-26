import Foundation
import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) var id: UUID

    var name: String
    var currency: String
    var total: Double
    
    @Relationship var transactions: [Transaction]? = []
    
    // Add indexe for name
    #Index<Account>([\.name])
    
    init(name: String = "",
         currency: String = "USD") {
        self.id = UUID()
        self.name = name
        self.currency = currency
        self.total = 0.0
    }
    
}

@Observable
class AccountViewModel {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func createAccount(name: String,
                       currency: String) {
        
        modelContext.insert(
            Account(name: name, currency: currency))
        
        print("createAccount")
        _ = modelContext.save
    }
    
    func fetchAccount() -> [Account] {
        do {
            let account = try modelContext.fetch(FetchDescriptor<Account>())
            return account
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return []
        }
    }
    
    static func formatAmount(_ total: Double, for currency: String) -> String {
        return total.formatted(.currency(code: currency).presentation(.narrow))
    }

}
