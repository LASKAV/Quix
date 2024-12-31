import Foundation
import SwiftUI

//@Observable
struct Card: Identifiable {
    let id = UUID()
    let name: String
    let amount: String
    let currency: String
    let color: ColorResource
    // let skin: ImageResource
    
//    init(name: String,
//         amount: String,
//         currency: String,
//         color: ColorResource) {
//        self.name = name
//        self.amount = amount
//        self.currency = currency
//        self.color = color
//    }
    
    static let cardsData: [Card] = [
        Card(name: "Mono 🐈‍⬛",
             amount: Card.formatAmount(69563.00, for: "UAH"),
             currency: "UAH",
             color: .cardBlue
        ),
        Card(name: "DNB 🇳🇴",
             amount: Card.formatAmount(34000.00, for: "NOK"),
             currency: "NOK",
             color: .cardPink
        ),
        Card(name: "Binance 💎",
             amount: Card.formatAmount(4000.00, for: "USD"),
             currency: "USD",
             color: .cardYellow
        )
    ]
    
    static func formatAmount(_ amount: Double, for currency: String) -> String {
        return amount.formatted(.currency(code: currency).presentation(.narrow))
    }
}

struct CardView: View {
    
    let cardItem: Card
    
    private let cardWidth: CGFloat = 340
    private let cardHeight: CGFloat = 200
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(cardItem.color))
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedCorner(radius: 20))
                .shadow(color: .black.opacity(0.25),radius: 4, x: 2, y: 4)
            
            VStack(alignment: .center, spacing: 0) {
                
                Text(cardItem.name)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .top], 20)
                    .frame(width: cardWidth, alignment: .leading)
                
                Spacer()
                
                Text(cardItem.amount)
                    .font(.system(size: 35))
                    .foregroundStyle(Color.black)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(width: cardWidth, alignment: .center)
                
                Spacer()
                
                Text(cardItem.currency)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.trailing, .bottom], 20)
                    .frame(width: cardWidth, alignment: .trailing)
            }
            .frame(width: cardWidth, height: cardHeight)
        }
    }
}

struct CardViewManager: View {
    
    var cardItems = Card.cardsData
    
    var body: some View {
        TabView {
            ForEach(cardItems) { item in
                CardView(cardItem: item)
            }
        }
        .padding([.vertical], 230)
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            UIPageControl.appearance()
                .currentPageIndicatorTintColor = .blueIce
            UIPageControl.appearance()
                .pageIndicatorTintColor = UIColor.customGray
        }
    }
}


#Preview {
    CardViewManager()
}
