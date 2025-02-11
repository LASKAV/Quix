import SwiftUI

// MARK: Section Transaction Name
struct SectionNameView: View {
    private let title: String = "Transaction name"
    private let defaultName: String = "Apple Support"
    @Binding var transactionName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.primary)
                .lineLimit(1)
                TextField(defaultName, text: $transactionName)
                    .textFieldStyle(TextFieldStyleH1())
        }
    }
}

#Preview {
    
    @Previewable @State var transactionAmount = MenuViewModel()
    
    SectionNameView(transactionName: $transactionAmount.viewModel.name)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
}
