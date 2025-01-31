import SwiftUI
import Charts

// MARK # 0
func dataIsEmpty<T>(_ data: T?) async -> Bool {
    guard let data else {
        return true 
    }
    
    if let array = data as? [Any], array.isEmpty {
        return true 
    }
    
    return false
}

struct ChartDonut: View {
    
    // MARK: Data for Chart Donut
    // Here will be Transaction data
    @Binding var data: [TransactionCategoryChart]

    // MARK: Set up Donut
    @State private var currentAngle: Double = 0
    @State private var innerRadius: CGFloat = 0.4
    @State private var outerRadius: CGFloat = 0
    @State private var angularInset: CGFloat = 3
    
    let widthSize: CGFloat
    let heightSize: CGFloat
    
    var body: some View {
        Chart(data) { category in
            SectorMark(
                angle:
                .value("Amount", min(category.amount, currentAngle)),
                innerRadius: .ratio(innerRadius),
                outerRadius: .inset(outerRadius),
                angularInset: angularInset)
            .foregroundStyle(.gray.opacity(0.3))
            .cornerRadius(5)
        }
        .frame(width: widthSize, height: heightSize)
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                currentAngle = 300
            }
        }
        Title()
        ListDefault()
    }
}

private struct Title: View {
    var body: some View {
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
    }
}
private struct ListDefault: View {
    
    var listWidth: CGFloat = 340
    var listHeight: CGFloat = 20
    var backgroundColor: Color = Color.gray
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { _ in
                        HStack {
                            Circle()
                                .fill(backgroundColor)
                                .frame(width: 20, height: 20)
                            
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
        .padding(EdgeInsets(top: 20, leading: 30, bottom: 30, trailing: 30))
    }
}

#Preview {
    @Previewable
    @State
    var dataCategory: [TransactionCategoryChart] = mockCategory()
    ChartDonut(data: $dataCategory, widthSize: 300, heightSize: 300)
}
