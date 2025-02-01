import SwiftUI
import SwiftData

struct AccountSetupView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var amount: String?
    @State private var currency: CurrencyType = .usd
    @State private var cardColor: CardColor = .cardBlue
    
    @State private var isExpanded = false
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // MARK: Title
                TitleView()
                
                // MARK: CardView
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
                    
                    HStack(spacing: 10) {
                        Button(action: { isExpanded.toggle() }) {
                            HStack {
                                Text(currency.id)
                                Spacer()
                                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                                    .animation(.easeInOut(duration: 0.3), value: isExpanded)
                            }
                            .bold()
                            .foregroundStyle(Color.blue)
                            .padding(15)
                            .frame(maxWidth: 100)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedCorner(radius: 15))
                        }
                        .padding(.trailing, 25)
                        .sheet(isPresented: $isExpanded) {
                            CurrencyPicker(selectedCurrency: $currency, isExpanded: $isExpanded)
                                .presentationDetents([.height(230)])
                        }
                    }
                }
                .padding(.top, 40)
                
                Spacer()
                
                Button {
                    let account = Account(name: name, currency: currency.rawValue)
                    modelContext.insert(account)
                    navigateToNextScreen = true
                } label: {
                    Text("Continue")
                        .padding(EdgeInsets(top: 13, leading: 37, bottom: 13, trailing: 37))
                }
                .font(.system(size: 20, weight: .heavy, design: .default))
                .foregroundStyle(Color.white)
                .frame(maxWidth: 166, maxHeight: 50)
                .background(name.isEmpty ? Color.gray.opacity(0.3) : Color.blueIce)
                .clipShape(RoundedCorner(radius: 20))
                .disabled(name.isEmpty)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationDestination(isPresented: $navigateToNextScreen) {
                ScreenManagerView()
                    .navigationBarBackButtonHidden(true)
            }
        }
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
