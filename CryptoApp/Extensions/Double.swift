

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        return formatter
    }

    func asCurrencyWithDecimal6() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }

    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    func asPercentString() -> String {
        return asNumberString() + "%"
    }

    func formattedWithAbbreviations() -> String {
        let num = abs(self)
        let numFormatter = NumberFormatter()

        switch num {
        case 1_000_000_000_000...:
            numFormatter.numberStyle = .decimal
            return "$\((self / 1_000_000_000_000).asNumberString())T"
        case 1_000_000_000...:
            numFormatter.numberStyle = .decimal
            return "$\((self / 1_000_000_000).asNumberString())B"
        case 1_000_000...:
            numFormatter.numberStyle = .decimal
            return "$\((self / 1_000_000).asNumberString())M"
        default:
            return "$\(self)"
        }
    }
}
