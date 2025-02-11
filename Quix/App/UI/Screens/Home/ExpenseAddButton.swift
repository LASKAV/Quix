import SwiftUI

// MARK: Expense Button
struct ExpenseAddButton: View {
    
    var body: some View {
        
        NavigationLink {
        // MenuView(transactionVM: transactionVM)
        } label: {}
        
            .buttonStyle(ButtonStyleAdd())
            .padding(.trailing, 20)
        
    }
}
