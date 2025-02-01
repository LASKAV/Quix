import Foundation
import SwiftUI

//struct Card: Identifiable {
//    let id = UUID()
//    let name: String
//    let amount: String
//    let currency: String
//    let color: ColorResource
//    
//    static let cardsData: [Card] = [
//        Card(name: "Mono 🐈‍⬛",
//             amount: Card.formatAmount(69563.00, for: "UAH"),
//             currency: "UAH",
//             color: .cardBlue
//        ),
//        Card(name: "DNB 🇳🇴",
//             amount: Card.formatAmount(34000.00, for: "NOK"),
//             currency: "NOK",
//             color: .cardPink
//        ),
//        Card(name: "Binance 💎",
//             amount: Card.formatAmount(4000.00, for: "USD"),
//             currency: "USD",
//             color: .cardYellow
//        )
//    ]
//    
//    static func formatAmount(_ amount: Double, for currency: String) -> String {
//        return amount.formatted(.currency(code: currency).presentation(.narrow))
//    }
//}

struct CardView: View {
    
    @Binding var Cardcolor: CardColor
    @Binding var name: String
    @Binding var amount: String?
    @Binding var currency: CurrencyType
    
    private let cardWidth: CGFloat = 340
    private let cardHeight: CGFloat = 200
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Cardcolor.color)
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedCorner(radius: 20))
                .shadow(color: .black.opacity(0.25),radius: 4, x: 2, y: 4)
            
            VStack(alignment: .center, spacing: 0) {
                
                Text(name)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .top], 20)
                    .frame(width: cardWidth, height: cardHeight / 3, alignment: .topLeading)
                    
                
                Text("\(currency.symbol) \(amount ?? "00.00")")
                    .font(.system(size: 35))
                    .foregroundStyle(Color.black)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(width: cardWidth, height: cardHeight / 3, alignment: .center)
                
                Text(currency.rawValue)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.trailing, .bottom], 20)
                    .frame(width: cardWidth, height: cardHeight / 3, alignment: .bottomTrailing)
                    
            }
            .frame(width: cardWidth, height: cardHeight)
        }
    }
}

