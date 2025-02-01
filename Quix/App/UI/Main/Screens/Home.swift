import SwiftUI

struct HomeScreen: View {
    @State private var title = "Home"
    @State private var name = "Test"
    @State private var amount: String?
    @State private var currency: CurrencyType = .usd
    @State private var cardColor: CardColor = .cardBlue
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top) {
                // MARK: Title
                TitleViewModel(name: $title)
                
                // MARL: Title button plus
                AddExpenseButton()
                
            }
            
            // MARK: CardView
            CardView(
                Cardcolor: $cardColor,
                name: $name,
                amount: $amount,
                currency: $currency)
            
            VStack(spacing: 0) {
                // MARK: Title Transaction
                TransactionTitleView()
                
                // MARK: ListTransaction / Default
                ListTransactionDefault(columnsCount: 5, titleName: "No Transactions")
            }
            Spacer()
        }
    }
}

struct ListTransactionDefault: View {
    
    var listWidth: CGFloat = 340
    var listHeight: CGFloat = 50
    var backgroundColor: Color = Color.gray
    var columnsCount: Int
    var titleName: String
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Text(titleName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.secondary)
            
            VStack(spacing: 20) {
                ForEach(0..<columnsCount, id: \.self) { _ in
                    Rectangle()
                        .fill(backgroundColor)
                        .frame(width: listWidth, height: listHeight)
                        .clipShape(RoundedCorner(radius: 10))
                        .opacity(isAnimating ? 0.08 : 0.3)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
            }
            .padding(.horizontal, 30)
            .onAppear { isAnimating = true }
        }
    }
}

// MARK: Expense Button
struct AddExpenseButton: View {
    
//    @ObservedObject var transactionVM: TransactionViewModel
    
    var body: some View {
        
        NavigationLink {
//            MenuView(transactionVM: transactionVM)
        } label: {}
        
        .buttonStyle(ButtonStyleAdd())
        .padding(.trailing, 20)
        
    }
}

// MARK: Button Style Add
struct ButtonStyleAdd: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image.plus
            .resizable()
            .frame(width: 40, height: 40)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.customViolet, .clear)
    }
}

struct TransactionTitleView: View {
    
//    @ObservedObject var transactionVM: TransactionViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            
            // MARK: Title
            Text("Transactions")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.black)
            
            Spacer()
            
            // MARK: Link to All Transactions
            NavigationLink {
                ListTransactionDefault(columnsCount: 10,titleName: "")
                    .navigationTitle("Transactions")
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                HStack(spacing: 5) {
                    Text("All")
                    Image(systemName: "chevron.right")
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.customViolet)
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
    }
}

struct TitleViewModel: View {
    @Binding var name: String
    var body: some View {
        Text(name)
            .font(.system(size: 25, weight: .semibold))
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .bold()
            .padding(EdgeInsets(top: 0,
                                leading: 20,
                                bottom: 25,
                                trailing: 0))
    }
}

#Preview {
    HomeScreen()
}
