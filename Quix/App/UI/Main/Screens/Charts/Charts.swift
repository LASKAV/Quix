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
private func mockCategory() -> [TransactionCategoryChart] {
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
    @State private var currentAngle: Double = 0
    
    var body: some View {
        ScrollView {
            VStack {
                TitleViewModel(name: $title)
                
                Chart(mockCategory()) { category in
                    SectorMark(
                        angle:
                                .value("Amount", min(category.amount, currentAngle)),
                        innerRadius: .ratio(0.4),
                        outerRadius: .inset(0),
                        angularInset: 1
                    )
                    
                    .foregroundStyle(.gray.opacity(0.3))
                    .cornerRadius(5)
                }
                .frame(width: 300, height: 300)
                .onAppear {
                    withAnimation(.linear(duration: 1)) {
                        currentAngle = 300
                    }
                }
                
                
                
                HStack(alignment: .center, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Category")
                            .font(.system(size: 18, weight: .regular))
                        
                        Text("over the last month")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                }
                .frame(width: 340, alignment: .leading)
                
                ListCategoryDefault(titleName: "")
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 30, trailing: 30))
                
                HStack(alignment: .center, spacing: 0) {
                    Text("Amount")
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    Text("over the last 5 months")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.secondary)
                }
                .frame(width: 340, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                
                Chart(mockCategory()) { item in
                    BarMark(
                        x: .value("Month", item.name),
                        y: .value("Monthly Balance", item.amount)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.gray.opacity(0.3))
                }
                
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                .frame(maxWidth: .infinity, maxHeight: 250)
                
                .chartXAxis {
                    AxisMarks(values: .automatic) { _ in
                        // Month labels
                        AxisValueLabel()
                    }
                }
                .chartXAxis(.hidden)
            }
        }
    }
}

#Preview {
    ChartsScreen()
}
