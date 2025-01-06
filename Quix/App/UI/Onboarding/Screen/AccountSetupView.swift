import SwiftUI
import SwiftData

enum CardColor: Hashable {
    case cardBlue
    case cardPink
    case cardYellow
    
    var color: Color {
        switch self {
        case .cardBlue:
            return Color.cardBlue
        case .cardPink:
            return Color.cardPink
        case .cardYellow:
            return Color.cardYellow
        }
    }
    
}

struct AccountSetupView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = "Mono Bank"
    @State private var amount: String?
    @State private var currency = "USD"
    @State private var cardColor: CardColor = .cardBlue
    
    @State private var isExpanded = false
    @State private var selectedOption: Category?
    
    
    var body: some View {
        VStack(spacing: 0 ) {
            
            CardView(
                Cardcolor: $cardColor,
                name: $name,
                amount: $amount,
                currency: $currency
            )
            HStack(spacing: 20) {
                TextField("Account name", text: $name)
                    .textFieldStyle(TextFieldStyleH1())
                    .padding([.leading], 25)
                
                TextField("Account name", text: $name)
                    .textFieldStyle(TextFieldStyleH1())
                    .padding(.trailing, 25)
            }
            .padding(.top, 40)
        }
    }
}

// MARK: Custom TextField Transaction
struct TextFieldStyleH1: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
                .bold()
                .foregroundStyle(Color.blue)
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedCorner(radius: 15))
    }
}

#Preview {
    AccountSetupView()
}
