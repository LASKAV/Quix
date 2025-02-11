import SwiftUI


struct SearchableDropdownMenu: View {
    @State private var isExpanded = false
    @State private var selectedOptionDefault = "Select an Category"
    @State private var searchText = ""
    @State private var selectedOption: Category?
    @Binding var transactionCategory: String

    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return Category.allCases
        } else {
            return Category.allCases.filter { $0.rawValue.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Transaction category")
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.primary)
                .lineLimit(1)
            
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    Text(selectedOption?.rawValue ?? selectedOptionDefault)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedCorner(radius: 15))
            }
            .foregroundStyle(Color.appAccent)
            
            .overlay(
                ZStack {
                    if isExpanded {
                        VStack(spacing: 0) {
                            TextField("Search...", text: $searchText)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            List(filteredCategories) { option in
                                Text(option.rawValue)
                                    .padding(.vertical, 10)
                                    .onTapGesture {
                                        selectedOption = option
                                        selectedOptionDefault = option.rawValue
                                        transactionCategory = option.rawValue
                                        isExpanded = false
                                        searchText = ""
                                    }
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: 170)
                        }
                        .background(Color.appAccent)
                        .clipShape(RoundedCorner(radius: 15))
                        .shadow(radius: 5)
                        .padding(.vertical, 60)
                        .frame(maxWidth: .infinity)
                        .transition(.identity)
                    }
                }
                , alignment: .topLeading
            )
        }
        .animation(.linear, value: isExpanded)
        .zIndex(1)
    }
}


#Preview {
    @Previewable @State var transactionAmount = MenuViewModel()
    
    SearchableDropdownMenu(transactionCategory: $transactionAmount.viewModel.category)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
}

