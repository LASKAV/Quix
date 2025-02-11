import SwiftUI
import SwiftData

struct MenuView: View {
    
    @State private var viewModel = TransactionViewModel()
    @Query private var users: [User]
    @State private var menuVM = MenuViewModel()
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var close
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .center, spacing: 20) {
                    
                    // MARK: Section name
                    SectionNameView(
                        transactionName: $menuVM.viewModel.name)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                    
                    // MARK: Section category
                    SearchableDropdownMenu(transactionCategory: $menuVM.viewModel.category)
                        .padding([.leading, .trailing], 20)
                    
                    HStack(spacing: 0) {
                        
                        // MARK: Section amount
                        SectionAmountView(amount: $menuVM.viewModel.amount)
                        
                        Spacer()
                        
                        // MARK: Section type
                        SectionTypeView(isExpense: $menuVM.viewModel.isExpense)
                    }
                    .padding([.leading, .trailing], 20)
                    
                    // MARK: Section date
                    SectionDateView(date: $menuVM.viewModel.date)
                        .padding([.leading, .trailing], 20)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .ignoresSafeArea(.keyboard)
        .toolbar(.hidden, for: .tabBar)
        
        .toolbar {
            // Combine all toolbar items here
            ToolbarItem(placement: .principal) {
                Text("Transaction")
                    .font(.headline)
                    .bold()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    if menuVM.menuItemsValid(items: menuVM.viewModel)
                    {
                        //                        viewModel.modelContext = modelContext
                        //                        viewModel.addTransaction(
                        //                            name: menuVM.viewModel.name, category: menuVM.viewModel.category,
                        //                            amount: menuVM.viewModel.amount, isExpense: menuVM.viewModel.isExpense)
                        close()
                    }
                }
                
                .disabled(!menuVM.menuItemsValid(items: menuVM.viewModel))
                .foregroundColor(!menuVM.menuItemsValid(items: menuVM.viewModel) ? .gray : .blue )
            }
            // Toolbar item for keyboard "Done" button
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { hideKeyboard() }
                    .padding(.leading)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    MenuView()
}


