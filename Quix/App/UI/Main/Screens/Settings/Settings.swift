import SwiftUI

struct SettingsScreen: View {
    @State private var title = "Settings"
    @State var isFaceID: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: Title
                TitleViewModel(name: $title)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Text("Language")
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                   
                    SectionDarkModeView()
                }
                .customContainerStyle()
                
                //MARK: Section App Lock
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Toggle(isOn: $isFaceID) {
                            Text("Face ID")
                                .font(.system(size: 16))
                        }
                    }
                    
                    HStack {
                        Text("Passcode to Unlock")
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
  
                }
                .customContainerStyle()
                
                //MARK: Section App Lock
                VStack(alignment: .leading, spacing: 10) {

                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            Text("About")
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Help & Support")
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Review App")
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            Image(systemName: "star")

                        }
                        
                        HStack {
                            Text("Share App")
                                .font(.system(size: 16))
                            
                            Spacer()
  
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                    }
                    .customContainerStyle()
                    
                }
                
                Text("Version EX: 0.1")
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
                    .padding([.leading], 30)
                
            }
        }
        .background(Color.white)
        .navigationBarTitleDisplayMode(.inline)
    }
}

import SwiftUI

extension View {
    func customContainerStyle() -> some View {
        self
            .padding(20)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .padding([.trailing, .bottom, .leading], 20)
    }
}


// MARK: Section Dark Mode
struct SectionDarkModeView: View {
    private let title: String = "Dark Mode"
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        Toggle(isOn: $isDarkMode) {
            Text("Dark Mode")
                .font(.system(size: 16))
        }
    }
}

// MARK: Section Currency
struct SectionCurrencyView: View {
    private let currencyTitle : String = "Currency"
    
    var body: some View {
        HStack {
            Text(currencyTitle)
                .font(.system(size: 16))
            
            Spacer()
            
            Text("USD")
            Image(systemName: "chevron.right")
        }
    }
}

#Preview {
    SettingsScreen()
}
