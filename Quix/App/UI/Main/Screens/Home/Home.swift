import SwiftUI
import SwiftData

struct HomeScreen: View {
    @State private var title = "Home"
    @State private var name = ""
    @State private var amount: String?
    @State private var currency: CurrencyType = .usd
    @State private var cardColor: CardColor = .cardBlue
    @Query private var transactions: [Transaction]
    @Query private var accounts: [Account]
    @Query private var users: [User]

 
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top) {
                
                // MARK: Title
                TitleViewModel(name: $title)
                
                // MARL: Title button plus
                AddExpenseButton()
                
            }
            
            // MARK: CardView
            CardView(
                cardColor: $cardColor,
                name: $name,
                amount: $amount,
                currency: $currency)
            
            VStack(spacing: 0) {
                
                // MARK: Title Transaction
                TransactionTitleView()
                
                if !transactions.isEmpty {
                    
                    // MARK: ListTransaction / Default
                    ListTransactionDefault(columnsCount: 5, titleName: "No Transactions")
                    
                } else {
                    List(mocke()) { transaction in
                        TransactionView(transaction: transaction)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                    
            }
            Spacer()
        }.onAppear {
            guard let user = users.first else {
                print("No user found!")
                return
            }
            if let account = user.accounts.first {
                name = account.name
                currency = CurrencyType(rawValue: account.currency) ?? .usd
                amount = String(format: "%.2f", account.total)
            }
        }
    }
}


#Preview {
    HomeScreen()
}
