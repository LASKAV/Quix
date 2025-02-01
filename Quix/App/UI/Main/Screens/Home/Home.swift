import SwiftUI
import SwiftData

struct HomeScreen: View {
    @State private var title = "Home"
    @State private var name = "Test"
    @State private var amount: String?
    @State private var currency: CurrencyType = .usd
    @State private var cardColor: CardColor = .cardBlue
    @Query private var transactions: [Transaction]
    
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
                Cardcolor: $cardColor,
                name: $name,
                amount: $amount,
                currency: $currency)
            
            VStack(spacing: 0) {
                
                // MARK: Title Transaction
                TransactionTitleView()
                
                if transactions.isEmpty {
                    
                    // MARK: ListTransaction / Default
                    ListTransactionDefault(columnsCount: 5, titleName: "No Transactions")
                    
                } else {
                    
                }
                    
            }
            Spacer()
        }
    }
}


#Preview {
    HomeScreen()
}
