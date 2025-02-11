//import SwiftUI
//import SwiftData
//
//
//struct TransactionListView: View {
//    private let transactionInfo = TransactionInfo()
//    @State private var selectedTransaction: Transaction? = nil
//    @State private var isPressed: Bool = false
//    
//    @Query private var transactions: [Transaction]
//    
//    var body: some View {
//        VStack(alignment: .center, spacing: 0) {
//            List(transactions.prefix(4)) { transaction in
//                
//                SectionListView(transactions: transaction)
//                    .listRowSeparator(.hidden)
//                    .onLongPressGesture(minimumDuration: 0.5) {
//                        
//                        isPressed = true
//                        print("Long Press on Transaction")
//                        
//                        
//                        let generator = UIImpactFeedbackGenerator(style: .heavy)
//                        generator.impactOccurred()
//                        
//                        transactionInfo.printTransactionInfo(
//                            transaction: transaction)
//                        selectedTransaction = transaction
//                    }
//                
//            }
////                .onDelete { indexSet in
////                    indexSet.map { transactions[$0] }
////                        .forEach { transactions.deleteTransaction($0) }
////                }
//                .listRowBackground(Color.clear)
//                .listRowSeparator(.hidden)
//            }
//            .scrollContentBackground(.hidden)
//            .scrollIndicators(.hidden)
//            .listSectionSeparator(.hidden)
//            .listStyle(PlainListStyle())
//            .padding([.top, .bottom], 0)
//        }
//    }
//
//
//
//#Preview {
//    TransactionListView()
//}
