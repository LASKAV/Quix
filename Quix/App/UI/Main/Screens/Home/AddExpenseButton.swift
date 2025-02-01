import SwiftUI

// MARK: Expense Button
struct AddExpenseButton: View {
        
    var body: some View {
        
        NavigationLink {
//            MenuView(transactionVM: transactionVM)
        } label: {}
        
        .buttonStyle(ButtonStyleAdd())
        .padding(.trailing, 20)
        
    }
}
