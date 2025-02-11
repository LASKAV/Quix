import SwiftUI

struct SectionAmountView: View {
    
    private let title: String = "Transaction amount"
    private let defaultAmount: String = "$ 0"
    @State private var inputAmount: String = ""
    @State private var isEditing: Bool = false
    
    @Binding var amount: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.primary)
                .lineLimit(1)
            
            TextField(defaultAmount, text: $inputAmount)
                .textFieldStyle(TextFieldStyleH1())
                .multilineTextAlignment(.leading)
            
                // MARK: Key board type
                .keyboardType(.decimalPad)
            
                .onChange(of: inputAmount) { newValue, _ in
                    let formattedValue = newValue.replacingOccurrences(of: ",", with: ".")
                        amount = Double(formattedValue) ?? 0.0
                    amount = Double(formattedValue) ?? 0
                    if amount >= 1.0 {
                        self.isEditing = true
                        print("isEditing = \(isEditing)")
                        print("amount = \(amount)")
                    } else {
                        self.isEditing = false
                    }
                }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    @Previewable @State var transactionAmount = MenuViewModel()
   
    SectionAmountView(
        amount: $transactionAmount.viewModel.amount)
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
}
