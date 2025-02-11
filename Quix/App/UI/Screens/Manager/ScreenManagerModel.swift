import Foundation
import SwiftUI

// TabBar sections
enum Screens: Hashable {
    case home
    case charts
    case accountSetup
    case settings
    
}

@Observable
final class ScreenType {
    var tabBarSections: Screens = .home
    
    private func ObserverSectionConsol(reviewd: ScreenType) {
        
        switch reviewd.tabBarSections {
        case .home:
            print("user section: Home")
        case .charts:
            print("user section: Charts")
        case .settings:
            print("user section: Settings")
        case .accountSetup:
            print("user section: Account Setup")
        }
    
    }
}
