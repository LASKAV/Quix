import Foundation
import SwiftUI


enum Category: String, Codable, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    // MARK: Expense Category
    case utilities =  "Utilities"
    case cellphoneAndInternet = "Cellphone & Internet"
    case mortgage = "Mortgage"
    case insurance = "Insurance"
    case taxes = "Taxes"
    case entertainment = "Entertainment"
    case clothingAndAccessories = "Clothing & Accessories"
    case membershipsAndSubscriptions = "Memberships & Subscriptions"
    case travel = "Travel"
    case businessInvestment = "Business Investment"
    case transportation = "Transportation"
    case foodAndDrinks = "Food & Drinks"
    case groceries = "Groceries"
    case repairs = "Repairs"
    case personalCare = "Personal Care"
    case healthCare = "Healthcare"
    case housingAndRent = "Housing / Rent"
    
    // MARK: Income Category
    case debitRepayment = "Debt Repayment"
    case giftsAndDonation = "Gifts & Donations"
    case bonus = "Bonus"
    
    // MARK: Get Category Type
    var isExpense: Bool {
        switch self {
        case .utilities,
                .cellphoneAndInternet,
                .mortgage,
                .insurance,
                .taxes,
                .entertainment,
                .clothingAndAccessories,
                .membershipsAndSubscriptions,
                .travel,
                .businessInvestment,
                .transportation,
                .foodAndDrinks,
                .groceries,
                .repairs,
                .personalCare,
                .healthCare,
                .housingAndRent:
            return true
        case .debitRepayment,
                .giftsAndDonation,
                .bonus:
            return false
        }
    }
    
}

// MARK: - Color Configuration
struct CategoryColors {
    static let defaultColor: Color = .gray
    static let expense: [Category: Color] = [
        .utilities: Color(red: 0.3, green: 0.6, blue: 1.0),
        .cellphoneAndInternet: Color(red: 0.8, green: 0.4, blue: 0.1),
        .mortgage: Color(red: 0.6, green: 0.3, blue: 0.8),
        .insurance: Color(red: 0.1, green: 0.7, blue: 0.4),
        .taxes: Color(red: 0.5, green: 0.5, blue: 0.5),
        .entertainment: Color(red: 0.9, green: 0.8, blue: 0.1),
        .clothingAndAccessories: Color(red: 0.6, green: 0.2, blue: 0.2),
        .membershipsAndSubscriptions: Color(red: 0.4, green: 0.4, blue: 0.9),
        .travel: Color(red: 0.2, green: 0.7, blue: 0.9),
        .businessInvestment: Color(red: 0.5, green: 0.3, blue: 0.1),
        .transportation: Color(red: 0.9, green: 0.6, blue: 0.2),
        .foodAndDrinks: Color(red: 0.3, green: 0.8, blue: 0.3),
        .groceries: Color(red: 0.1, green: 0.5, blue: 0.1),
        .repairs: Color(red: 0.8, green: 0.0, blue: 0.2),
        .personalCare: Color(red: 0.7, green: 0.5, blue: 0.9),
        .healthCare: Color(red: 0.9, green: 0.3, blue: 0.6),
        .housingAndRent: Color(red: 0.4, green: 0.6, blue: 0.9)
    ]
    
    static let income: [Category: Color] = [
        .debitRepayment: Color(red: 0.9, green: 0.2, blue: 0.2),
        .giftsAndDonation: Color(red: 1.0, green: 0.5, blue: 0.7),
        .bonus: Color(red: 0.4, green: 0.7, blue: 0.9)
    ]
    
    static func color(for category: String) -> Color {
           
            if let knownCategory = Category(rawValue: category) {
                if knownCategory.isExpense {
                    return expense[knownCategory] ?? defaultColor
                } else {
                    return income[knownCategory] ?? defaultColor
                }
            }
        
            return defaultColor
        }
}
