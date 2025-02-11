import SwiftUI

protocol ListCategoryDefaultModel {
    var listWidth: CGFloat { get set }
    var listHeight: CGFloat { get set }
    var backgroundColor: Color { get set }
}

struct ListCategoryDefaultViewModel: ListCategoryDefaultModel {
    var listWidth: CGFloat = 340
    var listHeight: CGFloat = 20
    var backgroundColor: Color = Color.gray
}


struct ListCategoryDefaultView: View {
    private let listCategoryDefaultVM = ListCategoryDefaultViewModel()
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { _ in
                        HStack {
                            Circle()
                                .fill(listCategoryDefaultVM.backgroundColor)
                                .frame(width: 15, height: 15)
                            
                            Rectangle()
                                .fill(listCategoryDefaultVM.backgroundColor)
                                .clipShape(RoundedCorner(radius: 5))
                                
                        }
                        .opacity(isAnimating ? 0.08 : 0.3)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
                    .frame(width: listCategoryDefaultVM.listWidth, height: listCategoryDefaultVM.listHeight)
            }
            .onAppear { isAnimating = true }
        }
    }
}
