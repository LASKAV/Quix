import SwiftUI


struct ScreenManagerView: View {
    @State var screen = ScreenType()
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $screen.tabBarSections) {
                    
                    // MARK: Screen Home
                    HomeScreen()
                        .tabItem {
                            Label { Text("Home") }
                            icon: { Image.house }
                        }.tag(Screens.home)
                    
                    // MARK: Screen Charts
                    ChartsScreen()
                        .tabItem {
                            Label { Text("Charts") }
                            icon: { Image.cellularbars }
                        }.tag(Screens.charts)
                    
                    // MARK: New card
                    AccountSetupView()
                        .tabItem {
                            Label { Text("Cards") }
                            icon: { Image.creditcard }
                        }.tag(Screens.accountSetup)
                        
                    
                    // MARK: Screen Settings
                    SettingsScreen()
                        .tabItem {
                            Label { Text("Settings") }
                            icon: { Image.gear }
                        }.tag(Screens.settings)
                    
                } .accentColor(Color.appAccent)
            }
        }
    }
}


#Preview {
    ScreenManagerView()
}
