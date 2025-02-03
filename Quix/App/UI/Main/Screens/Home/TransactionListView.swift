//import SwiftUI
//
//struct TransactionListView: View {
//    @ObservedObject var transactionVM: TransactionViewModel
//    private let transactionInfo = TransactionInfo()
//    @State private var selectedTransaction: Transaction? = nil
//    @State private var isPressed: Bool = false
//    
//    var body: some View {
//        VStack(alignment: .center, spacing: 0) {
//            List {
//                ForEach(transactionVM.transactions.prefix(4)) { transaction in
//                    ZStack {
//                        
//                        TransactionRowView(transaction: transaction)
//                            .listRowSeparator(.hidden)
//                            .onLongPressGesture(minimumDuration: 0.5) {
//                                
//                                isPressed = true
//                                print("Long Press on Transaction")
//                                
//                                
//                                let generator = UIImpactFeedbackGenerator(style: .heavy)
//                                generator.impactOccurred()
//                                
//                                transactionInfo.printTransactionInfo(
//                                    transaction: transaction)
//                                selectedTransaction = transaction
//                            }
//                    }
//                }
//                .onDelete { indexSet in
//                    indexSet.map { transactionVM.transactions[$0] }
//                        .forEach { transactionVM.deleteTransaction($0) }
//                }
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
//}
//
//
//#Preview {
//    @Previewable @StateObject var transaction = TransactionViewModel()
//    TransactionListView(transactionVM: transaction)
//}
