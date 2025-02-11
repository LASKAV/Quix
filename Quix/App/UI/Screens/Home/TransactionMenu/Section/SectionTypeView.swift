import SwiftUI

// MARK: Section Transaction Type
struct SectionTypeView: View {
    private let title = "Transaction type"
    @Binding var isExpense: Bool
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.primary)
                .lineLimit(1)
            
            HStack(alignment: .center, spacing: 0) {
                Toggle(isOn: $isExpense) {}
                .toggleStyle(ToggleTypeStyle())
                .onChange(of: isExpense) { _ , _ in
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var transactionAmount = MenuViewModel()
    
    SectionTypeView(
        isExpense: $transactionAmount.viewModel.isExpense)
}
