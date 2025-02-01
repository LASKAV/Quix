import Foundation
import SwiftData

// MARK: Account Model
@Model
final class Account {
    
    @Attribute(.unique) var id: UUID

    var name: String
    var currency: String
    var total: Double
    
    init(name: String,
         currency: String) {
        self.id = UUID()
        self.name = name
        self.currency = currency
        self.total = 0.0
        print("name: \(name), currency: \(currency)")
    }
    
}

@Observable
class AccountViewModel {
    static func formatAmount(_ total: Double, for currency: String) -> String {
        return total.formatted(.currency(code: currency).presentation(.narrow))
    }
}
