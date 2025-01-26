import SwiftUI
import SwiftData


struct AccountSetupView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var viewModel: AccountViewModel?
    
    @State private var name = "Mono Bank"
    @State private var amount: String?
    @State private var currency = "USD"
    @State private var cardColor: CardColor = .cardBlue
    
    @State private var isExpanded = false
    @State private var selectedOption: Category?
    
    var body: some View {
        
        VStack(spacing: 0 ) {
            
            // MARK: Title
            TitleView()
            
            // MARK: CardView
            CardView(
                Cardcolor: $cardColor,
                name: $name,
                amount: $amount,
                currency: $currency)
            
            HStack(spacing: 20) {
                TextField("Account name", text: $name)
                    .textFieldStyle(TextFieldStyleH1())
                    .padding([.leading], 25)
                
                HStack(spacing: 10) {
                    Button(action: { isExpanded.toggle() }) {
                        HStack {
                            Text(currency)
                            
                            Spacer()
                            
                            Image(systemName: isExpanded ?
                                  "chevron.up" :
                                  "chevron.down")
                            .animation(.snappy,
                                       value: isExpanded)
                        }
                        .bold()
                        .foregroundStyle(Color.blue)
                        .padding(15)
                        .frame(maxWidth: 100)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedCorner(radius: 15))
                    }
                    .padding(.trailing, 25)
                }
            }
            .padding(.top, 40)
            
            Spacer()
            
            Button {
                viewModel = AccountViewModel(modelContext: modelContext)
//                viewModel?.createAccount(name: name, currency: currency)
            } label: {
                Text("Continue")
                    .padding(EdgeInsets(
                        top: 13, leading: 37,
                        bottom: 13, trailing: 37))
            }
            .buttonStyle(OnbordingExtraButton())
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


private struct TitleView: View {
    var body: some View {
        Text("Account setup")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color.secondary)
            .lineSpacing(5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .padding([.leading], 30)
    }
}


#Preview {
    AccountSetupView()
}
