import SwiftUI


extension Image {
    static let bell = Image(systemName: "bell.badge")
    static let chevron = Image(systemName: "chevron.right")
    static let plus = Image(systemName: "plus.circle.fill" )
    static let returnButton = Image(systemName: "xmark.circle")
    
    static let house = Image(systemName: "house")
    static let cellularbars = Image(systemName: "cellularbars")
    static let gear = Image(systemName: "gear")
    static let lock = Image(systemName: "eyes.inverse")
}


struct ScreenManagerView: View {
    @State var screen = ScreenType()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // default tabBarSections = .home
                TabView(selection: $screen.tabBarSections) {
                    // MARK: Screen Home
                    HomeScreen()
                        .tabItem {
                            Label {
                                Text("Home")
                            } icon: {
                                Image.house
                            }
                        }
                        .tag(Screens.home)
                    
                    // MARK: Screen Charts
                    ChartsScreen()
                        .tabItem {
                            Label {
                                Text("Charts")
                            } icon: {
                                Image.cellularbars
                            }
                        }
                        .tag(Screens.charts)
                    
                    // MARK: Screen Settings
                    SettingsScreen()
                        .tabItem {
                            Label {
                                Text("Settings")
                            } icon: {
                                Image.gear
                            }
                        }
                        .tag(Screens.settings)
                }
                .accentColor(Color.customViolet)
            }
        }
    }
    
}


#Preview {
    ScreenManagerView()
}
