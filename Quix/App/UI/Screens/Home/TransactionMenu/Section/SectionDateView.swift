import SwiftUI


struct SectionDateView: View {
    
    let title: String = "Transaction date"
    @Binding var date: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.primary)
                .lineLimit(1)
            
            DatePicker("", selection: $date, displayedComponents: [.date])
            .accentColor(Color.appAccent)
            .datePickerStyle(.graphical)
            .padding(.top, -20)
            .onChange(of: date) { newValue, _ in
                saveDateInfo(newValue)
                print("Date changed to: \(formattedDate(date: newValue))")
            }
            
        }
    }
}

func saveDateInfo(_ date: Date) {
    print("Date is saved: \(formattedDate(date: date))")
}
func formattedDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter.string(from: date)
}

#Preview {
    @Previewable @State var menuVM = MenuViewModel()
    
    SectionDateView(date: $menuVM.viewModel.date)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
}
