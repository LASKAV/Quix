import SwiftUI

struct TitleViewModel: View {
    @Binding var name: String
    var body: some View {
        Text(name)
            .font(.system(size: 25, weight: .semibold))
            .foregroundStyle(Color.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .bold()
            .padding(EdgeInsets(top: 0,
                                leading: 20,
                                bottom: 25,
                                trailing: 0))
    }
}
