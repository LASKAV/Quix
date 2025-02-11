import SwiftUI


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


// MARK: Custom Toggle Style Type
struct ToggleTypeStyle: ToggleStyle {
    
    private var titileIncome: String = "Income"
    private var titileExpense: String = "Expense"
    private var incomeColor: Color = .blue
    private var expenseColor: Color = .red
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            RoundedRectangle(cornerRadius: 15)
            
                .fill(configuration.isOn ? incomeColor : expenseColor)
                .overlay {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 43)
                        .clipShape(RoundedCorner(radius: 12))
                        .overlay {
                            if configuration.isOn {
                                Text(titileIncome)
                                    .font(.system(size: 16))
                                    .foregroundColor(incomeColor)
                                    
                            } else {
                                Text(titileExpense)
                                    .font(.system(size: 16))
                                    .foregroundColor(expenseColor)
                                    
                            }
                        }
                        .offset(x: configuration.isOn ? -41 : 41)
                }
                .frame(width: 180, height: 50)
                .onTapGesture {
                    withAnimation(.easeIn) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
