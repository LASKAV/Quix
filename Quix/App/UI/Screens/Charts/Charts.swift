import SwiftUI
import Charts

struct TitleLastMonthView: View {
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

struct ChartsScreenView: View {
    
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
    ChartsScreenView()
}
