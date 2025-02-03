import Foundation


// MARK: - Display transactions information
class TransactionInfo {
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    func printTransactionInfo(transaction: Transaction) {
        let name = transaction.name
        let date = formattedDate(transaction.date)
        let amount = transaction.amount
        let category = transaction.category
        let isExpense = transaction.isExpense ? "No" : "Yes"
        
        print("Transaction:")
        print("Name: \(name)")
        print("Date: \(date)")
        print("Amount: \(amount)")
        print("Category: \(category)")
        print("Is Expense: \(isExpense)")
        print("-----------------------")
    }

    func printAllTransactions(transactions: [Transaction]) {
        print("Current Transactions:")
        transactions.forEach { transaction in
            printTransactionInfo(transaction: transaction)
        }
    }
}
