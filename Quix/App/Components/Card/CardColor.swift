import Foundation
import SwiftUI

enum CardColor: Hashable {
    case cardBlue
    case cardPink
    case cardYellow
    
    var color: Color {
        switch self {
        case .cardBlue:
            return Color.cardBlue
        case .cardPink:
            return Color.cardPink
        case .cardYellow:
            return Color.cardYellow
        }
    }
}
