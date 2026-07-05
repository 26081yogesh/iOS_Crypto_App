import CoreData
import SwiftUI

@main
struct CryptoAppApp: App {
    @State private var homeViewModel = HomeViewModel()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
            .environment(homeViewModel)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
