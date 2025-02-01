import SwiftUI

struct ListTransactionDefault: View {
    
    var listWidth: CGFloat = 340
    var listHeight: CGFloat = 50
    var backgroundColor: Color = Color.gray
    var columnsCount: Int
    var titleName: String
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Text(titleName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.secondary)
            
            VStack(spacing: 20) {
                ForEach(0..<columnsCount, id: \.self) { _ in
                    Rectangle()
                        .fill(backgroundColor)
                        .frame(width: listWidth, height: listHeight)
                        .clipShape(RoundedCorner(radius: 10))
                        .opacity(isAnimating ? 0.08 : 0.3)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
            }
            .padding(.horizontal, 30)
            .onAppear { isAnimating = true }
        }
    }
}
