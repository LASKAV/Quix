import SwiftUI
import SwiftData

struct CardsTabView: View {
    
    @State private var pages: Int = 0
    @State private var accountViewModel = AccountViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @Query private var accounts: [Account]
    @Query private var transactions: [Transaction]
    let fakeCards = [
        CardData(name: "Mono 🐈‍⬛", amount: 10000.54, currency: .usd, cardColor: .cardBlue),
        CardData(name: "DNB 🇳🇴", amount: 500.00, currency: .eur, cardColor: .cardPink),
        CardData(name: "Binance 💎", amount: 2000.00, currency: .gbp, cardColor: .cardYellow)
    ]
    
    private let cardHeight: CGFloat = 220
    
    var body: some View {
        TabView(selection: $pages) {
            ForEach(0..<fakeCards.count, id: \.self) { index in
                VStack {
                    CardView(
                        cardColor: .constant(fakeCards[index].cardColor),
                        name: .constant(fakeCards[index].name),
                        amount: .constant(String(format: "%.2f", fakeCards[index].amount)),
                        currency: .constant(CurrencyType(rawValue: fakeCards[index].currency.rawValue) ?? .usd)
                    )
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: cardHeight)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<fakeCards.count, id: \.self) { index in
                    
                    Circle()
                        .frame(width: index == pages ? 12 : 12,
                               height: index == pages ? 12 : 12)
                        .foregroundStyle(index == pages ?
                                         Color.appAccent : Color.customGray)
                }
            }
            .scrollTargetLayout()
            .padding([.top, .bottom], 20)
        }
        .background(.clear, in: RoundedRectangle(cornerRadius: 30))
        .frame(width: 60)
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: Binding($pages), anchor: .center)
        .allowsTightening(false)
        
        .onAppear {
            accountViewModel.modelContext = modelContext
            accountViewModel.user = users.first
            accountViewModel.fetchAccounts()
        }
    }
}

#Preview {
    CardsTabView()
}

struct CardData {
    var name: String
    var amount: Double
    var currency: CurrencyType
    var cardColor: CardColor
}
