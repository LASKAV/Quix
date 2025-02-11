import Foundation
import SwiftUI

enum ErrorMenu: String {
    
    // MARK: Menu Items Error message
    case nameIsEmpty = "Error message (Menu): name is empty"
    case categoryIsEmpty = "Error message (Menu): category is empty"
    case amountIsEmpty = "Error message (Menu): amount is empty"
    case dateIsEmpty = "Error message (Menu): date is empty"
    
    // MARK: description
    var description: String { rawValue }
    
}

@Observable
final class MenuViewModel{
    var viewModel = Menu()
    
    
    // MARK: Items Valid
    func menuItemsValid (items: Menu) -> Bool {
        
        if viewModel.name.isEmpty {
            print(ErrorMenu.nameIsEmpty.description)
            return false
        }
        if viewModel.category.isEmpty {
            print(ErrorMenu.categoryIsEmpty.description)
            return false
        }
        if viewModel.amount < 0.0 {
            print(ErrorMenu.amountIsEmpty.description)
            return false
        }

        return true
    }
}
