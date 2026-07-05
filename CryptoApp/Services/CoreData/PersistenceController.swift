import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "PortfolioContainer")
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("Error: \(error)") }
        }
    }
}
