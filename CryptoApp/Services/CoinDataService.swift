

import Foundation

@Observable
class CoinDataService {
    var allCoins: [CoinModel] = []

    func getCoins() async throws {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=247&price_change_percentage=24h&sparkline=true"

        guard let url = URL(string: urlString) else {
            throw ErrorsEnum.badUrlString
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let code = (response as? HTTPURLResponse)?.statusCode ?? 0
            throw ErrorsEnum.invalidResponse(responseCode: code)
        }

        let decoder = JSONDecoder()

        allCoins = try decoder.decode([CoinModel].self, from: data)
    }
}
