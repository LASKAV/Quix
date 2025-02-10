import SwiftUI
import SwiftData

struct HomeScreen: View {
    @State private var title = "Home"
    @Query private var transactions: [Transaction]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top) {
                TitleViewModel(name: $title)
                AddExpenseButton()
            }
            
            CardsTabView()
            
            VStack(spacing: 0) {
                TransactionTitleView()
                if transactions.isEmpty {
                    List(mocke().prefix(5)) { transaction in
                        TransactionView(transaction: transaction)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                } else {
                    ListTransactionDefault(columnsCount: 5, titleName: "No Transactions")
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
