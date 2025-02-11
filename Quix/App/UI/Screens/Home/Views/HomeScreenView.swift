import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @State private var title = "Home"
    @Query private var transactions: [Transaction]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top) {
                TitleViewModel(name: $title)
                ExpenseAddButton()
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
    HomeScreenView()
}
