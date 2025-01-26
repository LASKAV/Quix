import SwiftUI

enum CurrencyType: String, CaseIterable, Identifiable {
    case usd = "USD" // United States Dollar
    case eur = "EUR" // Euro
    case gbp = "GBP" // British Pound Sterling
    case jpy = "JPY" // Japanese Yen
    case aud = "AUD" // Australian Dollar
    case cad = "CAD" // Canadian Dollar
    case chf = "CHF" // Swiss Franc
    case cny = "CNY" // Chinese Yuan
    case sek = "SEK" // Swedish Krona
    case nzd = "NZD" // New Zealand Dollar
    case uah = "UAH" // Ukrainian Hryvnia
    case rub = "RUB" // Russian Ruble
    case czk = "CZK" // Czech Koruna
    case nok = "NOK" // Norwegian Krone
    case aed = "AED" // United Arab Emirates Dirham

    var id: String { self.rawValue }

    /// Currency symbol
    var symbol: String {
        switch self {
        case .usd: return "$"    // Symbol for United States Dollar
        case .eur: return "€"    // Symbol for Euro
        case .gbp: return "£"    // Symbol for British Pound Sterling
        case .jpy: return "¥"    // Symbol for Japanese Yen
        case .aud: return "A$"   // Symbol for Australian Dollar
        case .cad: return "C$"   // Symbol for Canadian Dollar
        case .chf: return "CHF"  // Symbol for Swiss Franc
        case .cny: return "¥"    // Symbol for Chinese Yuan
        case .sek: return "kr"   // Symbol for Swedish Krona
        case .nzd: return "NZ$"  // Symbol for New Zealand Dollar
        case .uah: return "₴"    // Symbol for Ukrainian Hryvnia
        case .rub: return "₽"    // Symbol for Russian Ruble
        case .czk: return "Kč"   // Symbol for Czech Koruna
        case .nok: return "kr"   // Symbol for Norwegian Krone
        case .aed: return "د.إ"  // Symbol for United Arab Emirates Dirham
        }
    }
}

