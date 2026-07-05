import CoreData
import Foundation

@Observable
class CoreDataService {
    private let container = PersistenceController.shared.container

    func addCoin(name: String, image: String, currentHoldings: Double, currentHoldingValue: Double, symbol: String) {
        let viewContext = container.viewContext
        let newCoin = PortfolioEntity(context: viewContext)

        newCoin.name = name
        newCoin.currentHoldingValue = currentHoldingValue
        newCoin.symbol = symbol
        newCoin.image = image
        newCoin.currentHoldings = currentHoldings

        save()
    }

    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
}
