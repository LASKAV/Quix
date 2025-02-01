import SwiftUI
import Charts

struct ChartSteps: View {
    
    @Binding var data: [TransactionCategoryChart]
    
    let maxWidthSize: CGFloat
    let maxHeightSize: CGFloat
    
    var body: some View {
        Title()
        
        Chart(data) { item in
            BarMark(
                x: .value("Month", item.name),
                y: .value("Monthly Balance", item.amount)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.gray.opacity(0.3))
        }
        
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
        .frame(maxWidth: maxWidthSize, maxHeight: maxHeightSize)
        
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                // Month labels
                AxisValueLabel()
            }
        }
        .chartXAxis(.hidden)
        
    }
}

private struct Title: View {
    var body: some View {
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
    }
}

#Preview {
    @Previewable
    @State
    var data: [TransactionCategoryChart] = mockCategory()
    ChartSteps(data: $data, maxWidthSize: .infinity, maxHeightSize: 200)
}
