import SwiftUI
import SwiftData

struct TransactionTitleView: View {
    @Query private var transactions: [Transaction]
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            
            // MARK: Title
            Text("Transactions")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.black)
            
            Spacer()
            
            // MARK: Link to All Transactions
            NavigationLink {
                if transactions.isEmpty {
                    ListTransactionDefault(columnsCount: 10,titleName: "")
                        .navigationTitle("Transactions")
                        .navigationBarTitleDisplayMode(.inline)
                } else {
                    
                }
            } label: {
                HStack(spacing: 5) {
                    Text("All")
                    Image(systemName: "chevron.right")
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.customViolet)
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
    }
}
