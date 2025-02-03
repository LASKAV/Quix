import SwiftUI
import SwiftData

struct TransactionTitleView: View {
    @Query private var transactions: [Transaction]
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            
            // MARK: Title
            Text("Transactions")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color.primary)
            
            Spacer()
            
            // MARK: Link to All Transactions
            NavigationLink {
                if transactions.isEmpty {
                    ListTransactionDefault(columnsCount: 10,titleName: "")
                        .navigationTitle("Transactions")
                        .navigationBarTitleDisplayMode(.inline)
                } else {
                    SectionListView(transactions: transactions)
                }
            } label: {
                HStack(spacing: 5) {
                    Text("All")
                    Image(systemName: "chevron.right")
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.appAccent)
            }
        }
//        .padding(.top, 10)
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
    }
}
