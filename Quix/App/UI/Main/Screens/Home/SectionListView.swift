import SwiftUI
import SwiftData

struct SectionListView: View {
    
    var transactions: [Transaction]
    private let transactionInfo = TransactionInfo()
    
    var body: some View {
        List(transactions) { transaction in
            Section {
                TransactionView(transaction: transaction)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        transactionInfo.printTransactionInfo(transaction: transaction)
                    }
            } header: {
                HStack {
                    Text("May 2025")
                        .font(.system(size: 18, weight: .medium))
                        .fontWeight(.semibold)
                    Spacer()
                    Text("1000")
                        .font(.system(size: 18, weight: .medium))
                        .fontWeight(.semibold)
                }
            }
            
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .toolbar(.hidden, for: .tabBar)
        
//        }
//        ZStack {
//            VStack(alignment: .center) {
//                List {
//                    ForEach(Array(transaction.groupTransactionsByMonth), id: \.0) { (month, monthlyTransactions) in
//                        Section {
//                            ForEach(monthlyTransactions) { transaction in
//                                TransactionView(transaction: transaction)
//                                    .listRowSeparator(.hidden)
//                                    .onTapGesture {
//                                        print("Tap Transactions List All View")
//                                        transactionInfo.printTransactionInfo(transaction: transaction)
//                                    }
//                            }
//                            .onDelete { indexSet in
//                                indexSet.map { monthlyTransactions[$0] }
//                                    .forEach { transactionToDelete in
//                                        transaction.deleteTransaction(transactionToDelete)
//                                    }
//                            }
//                        } header: {
//                            Text(transaction.formatMonthString(month: month))
//                                .font(.system(size: 16))
//                                .fontWeight(.semibold)
//                        }
//                    }
//                }
//                .scrollContentBackground(.hidden)
//                .background(Color.customBackground)
//            }
//            .toolbar(.hidden, for: .tabBar)
//        }
//        .background(Color.customBackground)
    }
}

func mocke() -> [Transaction] {
     let transactions: [Transaction] = [
        Transaction(name: "Salary", category: .bonus, amount: 1500.0, date: Date().addingTimeInterval(-604800), isExpense: true),
        Transaction(name: "Salary", category: .bonus, amount: 1500.0, date: Date().addingTimeInterval(-604800), isExpense: true),
        Transaction(name: "Lunch", category: .foodAndDrinks, amount: 12.5, date: Date(), isExpense: false),
        Transaction(name: "Uber Ride", category: .transportation, amount: 8.75, date: Date().addingTimeInterval(-86400), isExpense: false),
        Transaction(name: "Movie Night", category: .entertainment, amount: 15.0, date: Date().addingTimeInterval(-172800), isExpense: false),
        Transaction(name: "Clothes Shopping", category: .clothingAndAccessories, amount: 50.0, date: Date().addingTimeInterval(-259200), isExpense: false),
        Transaction(name: "Salary", category: .bonus, amount: 1500.0, date: Date().addingTimeInterval(-604800), isExpense: true),
        Transaction(name: "Salary", category: .bonus, amount: 1500.0, date: Date().addingTimeInterval(-604800), isExpense: true)
    ]
    return transactions
}

#Preview {
    SectionListView(transactions: mocke())
}
