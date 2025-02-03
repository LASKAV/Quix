import Foundation

import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) var id: UUID

    var name: String
    var currency: String
    var total: Double
    
    @Relationship(deleteRule: .nullify)
    var user: User?
    
    @Relationship(deleteRule: .cascade, inverse: \Transaction.account)
    var transactions: [Transaction] = []
    
    var cardColor: CardColor
    
    init(name: String,
         currency: String,
         user: User? = nil,
         cardColor: CardColor) {
        self.id = UUID()
        self.name = name
        self.currency = currency
        self.total = 0.0
        self.user = user
        self.cardColor = cardColor
        print("name: \(name), currency: \(currency)")
    }
    
}

@Observable
class AccountViewModel {
    var modelContext: ModelContext? = nil
    var accounts: [Account] = []
    
    func fetchAccount() {
        let descriptor = FetchDescriptor<Account>(sortBy: [SortDescriptor(\.name)])
        accounts = (try? (modelContext?.fetch(descriptor) ?? [])) ?? []
    }
    
    func addAccount(name: String, currency: String, cardColor: CardColor) {
        let newAccount = Account(name: name, currency: currency, cardColor: cardColor)
        modelContext?.insert(newAccount)
        try? modelContext?.save()
        fetchAccount()
    }
    
    func deleteAccount(account: Account) {
        modelContext?.delete(account)
        try? modelContext?.save()
        fetchAccount()
    }
    
    func updateAccount(account: Account,
                       newName: String?,
                       newCurrency: String?,
                       newCardColor: CardColor?) {
        
        if let newName = newName {
            account.name = newName
        }
        if let newCurrency = newCurrency {
            account.currency = newCurrency
        }
        if let newCardColor = newCardColor {
            account.cardColor = newCardColor
        }
        try? modelContext?.save()
        fetchAccount()
        
    }
}

