
import Foundation

@Observable
class MarketDataService {
    var marketData: MarketDataModel?

    func getMarketData() async throws {
        let urlString = "https://api.coingecko.com/api/v3/global"

        guard let url = URL(string: urlString) else {
            throw ErrorsEnum.badUrlString
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let code = (response as? HTTPURLResponse)?.statusCode ?? 0
            throw ErrorsEnum.invalidResponse(responseCode: code)
        }

        let decoder = JSONDecoder()

        marketData = try decoder.decode(GlobalData.self, from: data).data
    }
}
