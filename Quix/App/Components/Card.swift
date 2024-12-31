import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    // let name: String
    // let amount: Double
    // let currency: String
    let color: ColorResource
    // let skin: ImageResource
    
    static let cardsData: [Card] = [
        Card(color: .cardBlue),
        Card(color: .cardPink),
        Card(color: .cardYellow)
    ]
    
}

struct CardView: View {
    
    let cardsData = Card(color: .cardYellow)
    
    private let cardWidth: CGFloat = 340
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(cardsData.color))
                .frame(width: cardWidth, height: 200)
                .clipShape(RoundedCorner(radius: 20))
            
            VStack(alignment: .center, spacing: 0) {
                
                Text("Mono 🐈‍⬛")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .top], 20)
                    .frame(width: cardWidth, alignment: .leading)
                
                Spacer()
                
                Text("$0.00")
                    .font(.system(size: 40))
                    .foregroundStyle(Color.black)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(width: cardWidth, alignment: .center)
                
                Spacer()
                
                Text("USD")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.trailing, .bottom], 20)
                    .frame(width: cardWidth, alignment: .trailing)
            }
            .frame(width: cardWidth, height: 200)
        }
    }
}



#Preview {
    CardView()
}
