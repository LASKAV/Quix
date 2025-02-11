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
    var user: User? = nil
    var accounts: [Account] = []
    var transactions: [Transaction] = []
        
    func fetchAccounts() {
        guard let userId = user?.id else { return }

        let descriptor = FetchDescriptor<Account>(
                predicate: #Predicate { account in
                    account.user?.id == userId
                },
                sortBy: [SortDescriptor(\.name)]
            )
        
        accounts = (try? modelContext?.fetch(descriptor) ?? []) ?? []
    }
    
    func addAccount(name: String, currency: String, cardColor: CardColor) {
            
            guard let user else { return }
            
            let newAccount = Account(name: name,
                                     currency: currency,
                                     user: user,
                                     cardColor: cardColor)
            
            modelContext?.insert(newAccount)
            try? modelContext?.save()
            fetchAccounts()
        }
    
    func deleteAccount(account: Account) {
        modelContext?.delete(account)
        try? modelContext?.save()
        fetchAccounts()
    }
    
    func updateAccount(account: Account,
                       newName: String?,
                       newCurrency: String?,
                       newCardColor: CardColor) {
        
        if let newName { account.name = newName }
        if let newCurrency { account.currency = newCurrency }
        account.cardColor = newCardColor
        
        try? modelContext?.save()
        fetchAccounts()
    }
}

