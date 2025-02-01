import SwiftUI

struct CurrencyPicker: View {
    @Binding var selectedCurrency: CurrencyType
    @Binding var isExpanded: Bool
    
    var body: some View {
        NavigationStack {
            Picker("", selection: $selectedCurrency) {
                ForEach(CurrencyType.allCases) { currency in
                    Text("\(currency.symbol) \(currency.rawValue)").tag(currency)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .navigationTitle("Currency")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

