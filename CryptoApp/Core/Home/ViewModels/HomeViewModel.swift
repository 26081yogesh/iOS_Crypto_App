import Foundation

@Observable
class HomeViewModel {
    var allCoins: [CoinModel] = []
    var portfolioCoins: [CoinModel] = []
    private let dataService = CoinDataService()

    var searchText: String = ""

    var filteredCoins: [CoinModel] {
        if searchText.isEmpty {
            return allCoins
        } else {
            let lowercasedSearch = searchText.lowercased()
            return allCoins.filter { coin in
                coin.name.lowercased().contains(lowercasedSearch) ||
                    coin.symbol.lowercased().contains(lowercasedSearch)
            }
        }
    }

    init() {
        Task {
            try? await dataService.getCoins()
            self.allCoins = dataService.allCoins
        }
    }
}
