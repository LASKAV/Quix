import SwiftUI


// MARK: Custom TextField Transaction
struct TextFieldStyleH1: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .bold()
            .foregroundStyle(Color.blue)
            .padding(15)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedCorner(radius: 15))
    }
}
