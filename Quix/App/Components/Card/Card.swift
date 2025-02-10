import Foundation
import SwiftUI

struct CardView: View {
    
    @Binding var cardColor: CardColor
    @Binding var name: String
    @Binding var amount: String?
    @Binding var currency: CurrencyType
    
    private let cardWidth: CGFloat = 340
    private let cardHeight: CGFloat = 200
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(cardColor.color)
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 4)
            
            VStack(alignment: .center, spacing: 0) {
                
                Text(name)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .top], 20)
                    .frame(width: cardWidth, height: cardHeight / 3, alignment: .topLeading)
                    
                Text(formattedAmount)
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
    private var formattedAmount: String {
        if let amount = amount, let doubleValue = Double(amount) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            
            return formatter.string(from: NSNumber(value: doubleValue)) ?? amount
        }
        return "00.00"
    }

}

