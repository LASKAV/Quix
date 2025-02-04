import SwiftUI
import SwiftData

struct HomeScreen: View {
    @State private var title = "Home"
    @State private var currentPage: Int = 0
    @State private var accountViewModel = AccountViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @Query private var accounts: [Account]
    @Query private var transactions: [Transaction]
    
    let fakeAccounts = [
        CardData(name: "Roma", amount: "10000.54", currency: .usd, cardColor: .cardBlue),
        CardData(name: "Savings", amount: "500.00", currency: .eur, cardColor: .cardPink),
        CardData(name: "Investment", amount: "2000.00", currency: .gbp, cardColor: .cardYellow)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top) {
                TitleViewModel(name: $title)
                AddExpenseButton()
            }
            
            if accounts.isEmpty {
                TabView(selection: $currentPage) {
                    ForEach(fakeAccounts, id: \.name) { fakeAccount in
                        CardView(
                            cardColor: .constant(fakeAccount.cardColor),
                            name: .constant(fakeAccount.name),
                            amount: .constant(String(format: "%.2f", fakeAccount.amount)),
                            currency: .constant(fakeAccount.currency)
                        )
                        .padding(.bottom, 40)
                        .tag(fakeAccounts.firstIndex(where: { $0.name == fakeAccount.name }) ?? 0)
                    }
                }
                .onChange(of: currentPage) { newValue, _ in
                    print("Current Page Updated: \(newValue)")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: 400, height: 240)
            } else {
                TabView(selection: $currentPage) {
                    ForEach(accountViewModel.accounts.indices, id: \.self) { index in
                        let account = accountViewModel.accounts[index]
                        CardView(
                            cardColor: .constant(account.cardColor),
                            name: .constant(account.name),
                            amount: .constant(String(format: "%.2f", account.total)),
                            currency: .constant(CurrencyType(rawValue: account.currency) ?? .usd)
                        )
                        .padding(.bottom, 40)
                        .tag(index)
                    }
                }
                .onChange(of: currentPage) { newValue, _ in
                    print("Current Page Updated: \(newValue)")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: 400, height: 240)
            }
            
            CustomPageControl(
                numberOfPages: accountViewModel.accounts.count,
                currentPage: currentPage,
                activeColor: .blueIce,
                inactiveColor: .gray,
                indicatorSize: 20
            )
            
            VStack(spacing: 0) {
                TransactionTitleView()
                
                if transactions.isEmpty {
                    List(mocke()) { transaction in
                        TransactionView(transaction: transaction)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                } else {
                    ListTransactionDefault(columnsCount: 5, titleName: "No Transactions")
                }
            }
            
            Spacer()
        }
        .onAppear {
            accountViewModel.modelContext = modelContext
            accountViewModel.user = users.first
            accountViewModel.fetchAccounts()
        }
    }
}


struct CustomPageControl: UIViewRepresentable {
    var numberOfPages: Int
    var currentPage: Int
    var activeColor: UIColor
    var inactiveColor: UIColor
    var indicatorSize: CGFloat

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        pageControl.pageIndicatorTintColor = inactiveColor
        pageControl.currentPageIndicatorTintColor = activeColor
        pageControl.frame.size = CGSize(width: CGFloat(numberOfPages) * indicatorSize, height: indicatorSize)
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = currentPage
    }
    
   
}

struct CardData {
    var name: String
    var amount: String
    var currency: CurrencyType
    var cardColor: CardColor
}

#Preview {
    HomeScreen()
}



