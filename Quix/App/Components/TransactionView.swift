import SwiftUI

struct TransactionView: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 5) {
                
                // MARK: Description
                Text(transaction.name)
                    .font(.system(size: 16, weight: .medium))
                
                // MARK: Category
                Text("\(transaction.category)")
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(Color.textGray)
                
            }
            
            Spacer()
            
            // MARK: amount
            VStack(alignment: .trailing, spacing: 5) {
                Text(transaction.isExpense ? String(format: "%.2f", transaction.amount): String(format: "- %.2f", transaction.amount))
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor( transaction.isExpense ? .appAccent : .red)
                
                // MARK: Date
                Text(transaction.date.formatted(.dateTime.day().month().year()))
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(Color.textGray)
            }
        }
        .padding(EdgeInsets(
            top: 0, leading: 10,
            bottom: 0, trailing: 10))
    }
}

#Preview {
    TransactionView(transaction: Transaction(name: "Lunch", category: .foodAndDrinks, amount: 12.5, date: Date(), isExpense: true))
}
