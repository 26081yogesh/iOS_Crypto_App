
import Foundation

@Observable
class StatisticsViewModel {
    var marketCap: Double = 0
    var volumeCap: Double = 0
    var isLoading: Bool = true
    private let dataService = MarketDataService()

    init() {
        fetchData()
    }

    func fetchData() {
        Task {
            do {
                try await dataService.getMarketData()
                await MainActor.run {
                    updateStatistics()
                    isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }

    private func updateStatistics() {
        marketCap = dataService.marketData?.marketCap ?? 0
        volumeCap = dataService.marketData?.volumeCap ?? 0
    }
}
