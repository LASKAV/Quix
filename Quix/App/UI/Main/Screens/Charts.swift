import SwiftUI
import Charts

struct TitleViewLastMonth: View {
    var body: some View {
        // MARK: Title
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Category")
                    .font(.system(size: 18, weight: .regular))
                
                Text("over the last month")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ListCategoryDefault: View {
    
    var listWidth: CGFloat = 340
    var listHeight: CGFloat = 20
    var backgroundColor: Color = Color.gray
    var titleName: String
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { _ in
                        HStack {
                            Circle()
                                .fill(backgroundColor)
                                .frame(width: 15, height: 15)
                            
                            Rectangle()
                                .fill(backgroundColor)
                                .clipShape(RoundedCorner(radius: 5))
                                
                        }
                        .opacity(isAnimating ? 0.08 : 0.3)
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
                .frame(width: listWidth, height: listHeight)
            }
            .onAppear { isAnimating = true }
        }
    }
}

struct TransactionCategoryChart: Identifiable {
    let name: String
    let amount: Double
    
    var id: String { name }
}

// MARK: Mock Category
func mockCategory() -> [TransactionCategoryChart] {
    let mockData: [TransactionCategoryChart] = [
        .init(name: "Mortgag", amount: 20),
        .init(name: "Utilities", amount: 40),
        .init(name: "Mortgage", amount: 60),
        .init(name: "Insurance", amount: 80),
        .init(name: "Debt Repayment", amount: 100)]
    return mockData
}

struct ChartsScreen: View {
    @State private var title = "Charts"
    @State private var dataCategory: [TransactionCategoryChart] = mockCategory()
    @State private var currentAngle: Double = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
    
                // MARK: Title
                TitleViewModel(name: $title)
                
                // MARK:  Chart Donut
                ChartDonut(data: $dataCategory,
                           widthSize: 300,
                           heightSize: 300)
                
                // MARK: Chart Steps
                ChartSteps(data: $dataCategory,
                           maxWidthSize: .infinity,
                           maxHeightSize: 200)
            }
        }
    }
}

#Preview {
    ChartsScreen()
}
