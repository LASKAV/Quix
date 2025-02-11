import SwiftData
import Foundation


@Observable
final class TransactionViewModel {
    var modelContext: ModelContext?
    var transactions: [Transaction] = []
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        fetchTransactions()
    }
    
    func fetchTransactions() {
        let descriptor = FetchDescriptor<Transaction>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        
        transactions = (try? modelContext?.fetch(descriptor) ?? []) ?? []
    }
    
    func addTransaction(name: String, category: Category, amount: Double, date: Date = Date(), isExpense: Bool, account: Account? = nil) {
        guard let modelContext else { return }
        
        let newTransaction = Transaction(
            name: name,
            category: category,
            amount: amount,
            date: date,
            isExpense: isExpense,
            account: account
        )
        
        modelContext.insert(newTransaction)
        
        do {
            try modelContext.save()
            fetchTransactions()
        } catch {
            print("Ошибка при сохранении транзакции: \(error)")
        }
    }
    
    func deleteTransaction(transaction: Transaction) {
        guard let modelContext else { return }
        
        modelContext.delete(transaction)
        
        do {
            try modelContext.save()
            fetchTransactions()
        } catch {
            print("Ошибка при удалении транзакции: \(error)")
        }
    }
    
    func updateTransaction(transaction: Transaction, newName: String?, newCategory: Category?, newAmount: Double?, newDate: Date?, isExpense: Bool?) {
        guard let modelContext else { return }
        
        if let newName { transaction.name = newName }
        if let newCategory { transaction.category = newCategory }
        if let newAmount { transaction.amount = newAmount }
        if let newDate { transaction.date = newDate }
        if let isExpense { transaction.isExpense = isExpense }
        
        do {
            try modelContext.save()
            fetchTransactions()
        } catch {
            print("Ошибка при обновлении транзакции: \(error)")
        }
    }
}
